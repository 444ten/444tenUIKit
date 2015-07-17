//
//  TENImageModel.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/13/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENImageModel.h"

#import "NSFileManager+TENExtensions.h"

#import "TENMacro.h"
#import "TENThread.h"

typedef void(^TENTaskCompletion)(id location, id response, id error);

@interface TENImageModel ()
@property (nonatomic, strong)   NSURL   *fileURL;

@property (nonatomic, readonly)                         NSString    *fileName;
@property (nonatomic, readonly)                         NSString    *filePath;
@property (nonatomic, readonly, getter=isFileAvailable) BOOL        fileAvailable;

@property (nonatomic, readonly) NSURLSession                *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;

+ (NSURLSession *)session;

- (TENTaskCompletion)taskCompletion;
- (void)loadImageAndNotify;

@end

@implementation TENImageModel

@dynamic fileName;
@dynamic filePath;
@dynamic fileAvailable;
@dynamic session;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

+ (NSURLSession *)session {
    static NSURLSession *__session = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        __session = [NSURLSession sessionWithConfiguration:configuration];
    });
    
    return __session;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.downloadTask = nil;
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.fileURL = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fileName {
    return [self.fileURL lastPathComponent];
}

- (NSString *)filePath {
    return [NSFileManager documentsPathWithFileName:self.fileName];
}

- (BOOL)isFileAvailable {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

- (NSURLSession *)session {
    return [[self class] session];
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

#pragma mark -
#pragma mark Overloading

- (void)performLoadingInBackground {
    TENUSleep(1000*1000 + 1000 * arc4random_uniform(1000));

    if (self.isFileAvailable) {
        [self loadImageAndNotify];
    } else {
        self.downloadTask = [self.session downloadTaskWithURL:self.fileURL
                                            completionHandler:[self taskCompletion]];
    }
}

#pragma mark -
#pragma mark Private

- (TENTaskCompletion)taskCompletion {
    return ^(NSURL *location, NSHTTPURLResponse *response, NSError *error) {
        if (nil != error || 200 != response.statusCode) {
            self.state = TENModelFailLoading;
            
            return;
        }
        
        NSError *fileManagerError = nil;
        [[NSFileManager defaultManager] copyItemAtURL:location
                                                toURL:[NSURL fileURLWithPath:self.filePath]
                                                error:&fileManagerError];

        if (nil != fileManagerError) {
            self.state = TENModelFailLoading;
            
            return;
        }
        
        [self loadImageAndNotify];
    };
}

- (void)loadImageAndNotify {
    self.image = [UIImage imageWithContentsOfFile:self.filePath];
    self.state = TENModelLoaded;
}

@end
