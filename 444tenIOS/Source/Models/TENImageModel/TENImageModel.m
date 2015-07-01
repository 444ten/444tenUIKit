//
//  TENImageModel.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/1/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENImageModel.h"

#import "TENImageModelDispatcher.h"

@interface TENImageModel ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   NSOperation *operation;

- (NSOperation *)imageLoadingOperation;

@end

@implementation TENImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.operation = nil;
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setOperation:(NSOperation *)operation {
    if (_operation != operation) {
        [_operation cancel];
        
        _operation = operation;
        
        if (operation) {
            TENImageModelDispatcher *dispatcher = [TENImageModelDispatcher sharedDispatcher];
            [dispatcher.queue addOperation:operation];
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        if (self.state == TENImageModelLoading) {
            return;
        }
        
        if (self.state == TENImageModelLoaded) {
            [self setState:TENImageModelLoaded];
            return;
        }
        
        self.state = TENImageModelLoading;
    }

    self.operation = [self imageLoadingOperation];
}

- (void)dump {
    self.operation = nil;
    self.image = nil;
    self.state = TENImageModelUnloaded;
}

#pragma mark -
#pragma mark Private

- (NSOperation *)imageLoadingOperation {
    __weak TENImageModel *weakSelf = self;
    
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        __strong TENImageModel *strongSelf = weakSelf;
        strongSelf.image = [UIImage imageWithContentsOfFile:[self.url absoluteString]];
    }];
    
    operation.completionBlock = ^{
        __strong TENImageModel *strongSelf = weakSelf;
        strongSelf.state = self.image ? TENImageModelLoaded : TENImageModelFailingLoading;
    };

    return operation;
}


@end
