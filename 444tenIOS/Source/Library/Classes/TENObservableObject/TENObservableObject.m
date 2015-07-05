//
//  TENObservableObject.m
//  HomeworkC
//
//  Created by Andrey Ten on 5/27/15.
//  Copyright (c) 2015 444ten. All rights reserved.
//

#import "TENObservableObject.h"

@interface TENObservableObject ()
@property (nonatomic, retain)   NSHashTable    *observerHashTable;

- (void)notifyOfStateChange:(NSUInteger)state withObject:(id)object;

@end

@implementation TENObservableObject

@dynamic observerSet;

@synthesize state = _state;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observerHashTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized (self) {
        _state = state;
        [self notifyOfStateChange:state withObject:object];
    }
}

- (NSUInteger)state {
    @synchronized (self) {
        return _state;
    }
}

- (NSSet *)observerSet {
    @synchronized (self) {
        return self.observerHashTable.setRepresentation;
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    @synchronized (self) {
        [self.observerHashTable addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized (self) {
        [self.observerHashTable removeObject:observer];
    }
}

- (BOOL)isObsevedByObserver:(id)observer {
    @synchronized (self) {
        return [self.observerHashTable containsObject:observer];
    }
}

- (SEL)selectorForState:(NSUInteger)state withObject:(id)object {
    return NULL;
}

#pragma mark -
#pragma mark Private

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

- (void)notifyOfStateChange:(NSUInteger)state withObject:(id)object {
    SEL selector = [self selectorForState:_state withObject:object];
    NSSet *observerSet = self.observerSet;
    
    for (id observer in observerSet) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}

#pragma clang diagnostic pop

@end
