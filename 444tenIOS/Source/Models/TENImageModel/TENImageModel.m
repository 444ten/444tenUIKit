//
//  TENImageModel.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/13/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENImageModel.h"

#import "NSFileManager+TENExtensions.h"
#import "NSURLSession+TENExtensions.h"

#import "TENObjectCache.h"
#import "TENMacro.h"

typedef void(^TENTaskCompletion)(id location, id response, id error);

static NSString * const kTENFailImageName   = @"cat.jpg";

@interface TENImageModel ()
@property (nonatomic, strong)   NSURL                       *fileURL;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;

@property (nonatomic, readonly)                         NSString    *fileName;
@property (nonatomic, readonly)                         NSString    *folderPath;
@property (nonatomic, readonly)                         NSString    *filePath;
@property (nonatomic, readonly, getter=isFileAvailable) BOOL        fileAvailable;

+ (TENObjectCache *)imageModelCache;
+ (UIImage *)failImage;

- (TENTaskCompletion)taskCompletion;

@end

@implementation TENImageModel

@dynamic fileName;
@dynamic filePath;
@dynamic folderPath;
@dynamic fileAvailable;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    TENObjectCache *imageModelCache = [self imageModelCache];
    
    @synchronized (imageModelCache) {
        id result = [imageModelCache objectForKey:url];
        
        if (!result) {
            result = [[self alloc] initWithURL:url];
            [imageModelCache setObject:result forKey:url];
        }
        
        return result;
    }
}

+ (TENObjectCache *)imageModelCache {
    static TENObjectCache *__imageModelCache = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __imageModelCache = [TENObjectCache new];
    });
    
    return __imageModelCache;
}

+ (UIImage *)failImage {
    static UIImage *__failImage = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __failImage = [UIImage imageNamed:kTENFailImageName];
    });
    
    return __failImage;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self cancel];
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.fileURL = url;
        [[NSFileManager defaultManager] createDirectoryAtPath:self.folderPath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setImage:(UIImage *)image {
    if (_image != image) {
        _image = image;
        self.state = TENModelLoaded;
    }
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

- (NSString *)fileName {
    return [self.fileURL lastPathComponent];
}

- (NSString *)folderPath {
    NSURL *url = self.fileURL;
    NSString *path = [url.host stringByAppendingPathComponent:[url.path stringByDeletingLastPathComponent]];
    
    return [NSFileManager documentsPathWithFileName:[path stringByStandardizingPath]];
}

- (NSString *)filePath {
    return [self.folderPath stringByAppendingPathComponent:self.fileName];
}

- (BOOL)isFileAvailable {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Public

- (void)cancel {
    [[[self class] imageModelCache] removeObjectForKey:self.fileURL];
    self.downloadTask = nil;
    self.image = nil;
}

#pragma mark -
#pragma mark Overloading

- (void)performLoadingInBackground {
    TENUSleep(1000*1000 + 1000 * arc4random_uniform(1000));
    
    if (self.isFileAvailable) {
        self.image = [UIImage imageWithContentsOfFile:self.filePath];
    } else {
        NSURLSession *session = [NSURLSession sharedEphemeralSessionForClass:[self class]];
        self.downloadTask = [session downloadTaskWithURL:self.fileURL
                                       completionHandler:[self taskCompletion]];
    }
}

#pragma mark -
#pragma mark Private

- (TENTaskCompletion)taskCompletion {
    return ^(NSURL *location, NSHTTPURLResponse *response, NSError *error) {
        UIImage *image = [[self class] failImage];

        if (nil == error && 200 == response.statusCode) {
            NSError *fileManagerError = nil;
            [[NSFileManager defaultManager] copyItemAtURL:location
                                                    toURL:[NSURL fileURLWithPath:self.filePath]
                                                    error:&fileManagerError];
        
            if (nil == fileManagerError) {
                image = [UIImage imageWithContentsOfFile:self.filePath];
            }
        }
        
        self.image = image;
    };
}

@end
