//
//  TENImage.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/13/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENImage.h"

#import "NSFileManager+TENExtensions.h"
#import "TENThread.h"

static NSString * const kTENFailImageName   = @"cat.jpg";

@interface TENImage ()
@property (nonatomic, strong)   UIImage *image;
@property (nonatomic, strong)   NSURL   *fileURL;

@property (nonatomic, readonly)                         NSString    *fileName;
@property (nonatomic, readonly)                         NSString    *filePath;
@property (nonatomic, readonly, getter=isFileAvailable) BOOL        fileAvailable;

@end

@implementation TENImage

@dynamic fileName;
@dynamic filePath;
@dynamic fileAvailable;


#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.fileURL = url;
        [self load];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

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

#pragma mark -
#pragma mark Overloading

- (void)setupLoading {
    if (self.isFileAvailable) {
        self.image = [UIImage imageWithContentsOfFile:self.filePath];
    } else {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        [[session downloadTaskWithURL:self.fileURL] resume];
    }
}

#pragma mark -
#pragma mark NSURLSessionDownloadDelegate

- (void)    URLSession:(NSURLSession *)session
                  task:(NSURLSessionTask *)task
  didCompleteWithError:(NSError *)error
{
    NSLog(@"%@", task);
    NSLog(@"%@", error);
}


- (void)        URLSession:(NSURLSession *)session
              downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didFinishDownloadingToURL:(NSURL *)location
{
    NSLog(@"%@", downloadTask);
    
    NSString *filePath = self.filePath;
    
    [[NSFileManager defaultManager] copyItemAtURL:location
                                            toURL:[NSURL fileURLWithPath:filePath]
                                            error:nil];
    self.image = [UIImage imageWithContentsOfFile:filePath];
}


@end
