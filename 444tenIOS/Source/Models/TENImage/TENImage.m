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

typedef void(^TENTaskCompletion)(NSURL *location, NSURLResponse *response, NSError *error);

static NSString * const kTENFailImageName   = @"cat.jpg";

@interface TENImage ()
@property (nonatomic, strong)   UIImage *image;
@property (nonatomic, strong)   NSURL   *fileURL;

@property (nonatomic, readonly)                         NSString    *fileName;
@property (nonatomic, readonly)                         NSString    *filePath;
@property (nonatomic, readonly, getter=isFileAvailable) BOOL        fileAvailable;

- (TENTaskCompletion)taskCompletion;

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

- (void)performLoadingInBackground {
    if (self.isFileAvailable) {
        self.image = [UIImage imageWithContentsOfFile:self.filePath];
        self.state = TENModelLoaded;
    } else {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        
        [[session downloadTaskWithURL:self.fileURL completionHandler:[self taskCompletion]] resume];
    }
}

#pragma mark -
#pragma mark Private

- (TENTaskCompletion)taskCompletion {
    return ^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (error) {
            self.image = [UIImage imageNamed:kTENFailImageName];
            self.state = TENModelLoaded;
            
            return;
        }
        
        NSString *filePath = self.filePath;
        
        [[NSFileManager defaultManager] copyItemAtURL:location
                                                toURL:[NSURL fileURLWithPath:filePath]
                                                error:nil];
        self.image = [UIImage imageWithContentsOfFile:filePath];
        self.state = TENModelLoaded;
    };
}

@end
