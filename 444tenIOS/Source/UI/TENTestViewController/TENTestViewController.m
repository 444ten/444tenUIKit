//
//  TENTestViewController.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/6/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENTestViewController.h"

#import "TENMacro.h"
#import "TENThread.h"

#import "NSFileManager+TENExtensions.h"

typedef void(^TENTaskCompletion)(NSURL *location, NSURLResponse *response, NSError *error);

static NSString * const kTENURL = @"https://upload.wikimedia.org/wikipedia/commons/2/22/Apple_computer_cat.jpg";

@interface TENTestViewController ()
@property (nonatomic, readonly)                         NSURL       *fileURL;
@property (nonatomic, readonly)                         NSString    *fileName;
@property (nonatomic, readonly)                         NSString    *filePath;
@property (nonatomic, readonly, getter=isFileAvailable) BOOL        fileAvailable;

- (TENTaskCompletion)taskCompletion;

@end

@implementation TENTestViewController 

@dynamic fileURL;
@dynamic fileName;
@dynamic filePath;
@dynamic fileAvailable;

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.isFileAvailable) {
        self.testImageView.image = [UIImage imageWithContentsOfFile:self.filePath];
    } else {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
// delegate
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        [[session downloadTaskWithURL:self.fileURL] resume];
        
// block
//        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
//        [[session downloadTaskWithURL:self.fileURL completionHandler:[self taskCompletion]] resume];
        
    }
    
}

#pragma mark -
#pragma mark Accessors

- (NSURL *)fileURL {
    return [NSURL URLWithString:kTENURL];
}

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
#pragma mark Private

- (TENTaskCompletion)taskCompletion {
    return ^ (NSURL *location, NSURLResponse *response, NSError *error) {
        TENSleep(1);
        NSString *filePath = self.filePath;
        
        [[NSFileManager defaultManager] copyItemAtURL:location
                                                toURL:[NSURL fileURLWithPath:filePath]
                                                error:nil];
        TENPerformOnMainThreadWithBlock(^{
            NSLog(@"%@", error);
            self.testImageView.image = [UIImage imageWithContentsOfFile:filePath];
        });
    };
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
    TENPerformOnMainThreadWithBlock(^{
        self.testImageView.image = [UIImage imageWithContentsOfFile:filePath];
    });
}

@end
