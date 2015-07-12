//
//  TENTestViewController.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/6/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENTestViewController.h"

#import "NSFileManager+TENExtensions.h"

static NSString * const kTENFailImageName   = @"cat.jpg";

static NSString * const kTENURL = @"https://upload.wikimedia.org/wikipedia/commons/2/22/Apple_computer_cat.jpg";
static NSString * const kTENURLImageName = @"Apple_computer_cat.jpg";


@interface TENTestViewController ()
@property (nonatomic, readonly)                         NSURL       *fileURL;
@property (nonatomic, readonly)                         NSString    *fileName;
@property (nonatomic, readonly)                         NSString    *filePath;
@property (nonatomic, readonly, getter=isFileAvailable) BOOL        fileAvailable;

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
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURL *downloadTaskURL = [NSURL URLWithString:kTENURL];
    
    NSURLSessionDownloadTask *task =
        [session downloadTaskWithURL:downloadTaskURL
                   completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                       NSFileManager *fileManager = [NSFileManager defaultManager];
                       UIImage *image = nil;
                       
                       if (self.isFileAvailable) {
                           image = [UIImage imageNamed:self.fileName];
                       } else {
                            [fileManager copyItemAtURL:location
                                                 toURL:[NSURL URLWithString:self.filePath]
                                                 error:nil];
                           
                           NSData *data = [[NSData alloc] initWithContentsOfURL:location];
                           image = [[UIImage alloc] initWithData:data];
                       }
                       
                       self.testImageView.image = image;
                   }];
    
    [task resume];
    
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


@end
