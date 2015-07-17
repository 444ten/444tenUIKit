//
//  TSTImageModelDispatcher.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/1/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TSTImageModelDispatcher.h"

@interface TSTImageModelDispatcher ()
@property (nonatomic, strong) NSOperationQueue    *queue;

- (void)initQueue;

@end

@implementation TSTImageModelDispatcher

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedDispatcher {
    static id dispatcher = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatcher = [self new];
    });

    return dispatcher;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.queue = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initQueue];
    }
    
    return self;
}

- (void)initQueue {
    NSOperationQueue *queue = [NSOperationQueue new];
    queue.maxConcurrentOperationCount = 2;
    
    self.queue = queue;
}

#pragma mark -
#pragma mark Accessors

- (void)setQueue:(NSOperationQueue *)queue {
    if (_queue != queue) {
        [_queue cancelAllOperations];
        
        _queue = queue;
    }
}

@end
