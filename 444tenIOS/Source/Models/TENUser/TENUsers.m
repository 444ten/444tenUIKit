//
//  TENUsers.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUsers.h"

#import "NSMutableArray+TENExtensions.h"

#import "TENUser.h"
#import "TENChangedPath.h"

static const NSUInteger TENUsersCount   = 5;

@interface TENUsers ()
@property (nonatomic, strong)   NSMutableArray          *users;

- (void)fillUsers:(NSMutableArray *)users;

@end

@implementation TENUsers

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype)init {
    self = [super init];
    if (self) {
        self.users = [NSMutableArray new];
        
        [self fillUsers:self.users];
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return [self.users count];
}

- (id)objectAtIndex:(NSUInteger)index {
    return [self.users objectAtIndex:index];
}

- (void)addObject:(id)object {
    [self.users addObject:object];
    [self setState:TENUsersChanged withObject:[TENChangedPath insertingPathWithIndex:[self count] - 1]];
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    [self.users insertObject:object atIndex:index];
    [self setState:TENUsersChanged withObject:[TENChangedPath insertingPathWithIndex:index]];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.users removeObjectAtIndex:index];
    [self setState:TENUsersChanged withObject:[TENChangedPath deletingPathWithIndex:index]];
}

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    [self.users moveObjectAtIndex:fromIndex toIndex:toIndex];
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index {
    [self.users setObject:object atIndexedSubscript:index];
    [self setState:TENUsersChanged withObject:[TENChangedPath reloadingPathWithIndex:index]];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.users[index];
}

#pragma mark -
#pragma mark Overload

- (SEL)selectorForState:(NSUInteger)state withObject:(id)object {
    switch (state) {
        case TENUsersChanged:
            return @selector(users:didChangedWithUsersInfo:);
        default:
            [super selectorForState:state withObject:object];
    }
    
    return NULL;
}

#pragma mark -
#pragma mark Private

- (void)fillUsers:(NSMutableArray *)users {
    for (NSUInteger index = 0; index < TENUsersCount; index++) {
        [self addObject:[TENUser user]];
    }
}

#pragma mark -
#pragma mark NSFastEnumeration protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len {
    return [self.users countByEnumeratingWithState:state objects:buffer count:len];
}

@end
