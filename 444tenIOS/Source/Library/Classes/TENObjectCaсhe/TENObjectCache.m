//
//  TENObjectCaсhe.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/17/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENObjectCache.h"

@interface TENObjectCache ()
@property (nonatomic, strong) NSMapTable    *imageCache;

@end

@implementation TENObjectCache

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.imageCache = [NSMapTable strongToWeakObjectsMapTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return self.imageCache.count;
}

- (id)objectForKey:(id)aKey {
    @synchronized (self) {
        return [self.imageCache objectForKey:aKey];
    }
}

- (void)removeObjectForKey:(id)aKey {
    @synchronized (self) {
        [self.imageCache removeObjectForKey:aKey];
    }
}

- (void)setObject:(id)anObject forKey:(id)aKey {
    @synchronized (self) {
        [self.imageCache setObject:anObject forKey:aKey];
    }
}

- (void)removeAllObjects {
    @synchronized (self) {
        [self.imageCache removeAllObjects];
    }
}

- (NSDictionary *)dictionaryRepresentation {
    @synchronized (self) {
        return [self.imageCache dictionaryRepresentation];
    }
}

@end
