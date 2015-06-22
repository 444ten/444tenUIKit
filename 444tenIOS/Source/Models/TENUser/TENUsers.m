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

static const NSUInteger TENUsersCount   = 5;

@interface TENUsers ()
@property   (nonatomic, strong)   NSMutableArray *users;

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
        
        self.state = TENUsersChangesShown;
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

- (void)addObject {
    TENUser *user = [TENUser new];
    user.name = [NSString stringWithFormat:@"User_%lu", [self count]];
    [self.users addObject:user];
    self.state = TENUsersChanged;
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    [self.users insertObject:anObject atIndex:index];
    self.state = TENUsersChanged;
}


- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.users removeObjectAtIndex:index];
    self.state = TENUsersChanged;
}

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    [self.users moveObjectAtIndex:fromIndex toIndex:toIndex];
    self.state = TENUsersChanged;
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    [self.users setObject:obj atIndexedSubscript:idx];
    self.state = TENUsersChanged;
}


- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.users[index];
}

#pragma mark -
#pragma mark Overload

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TENUsersChanged:
            return @selector(usersDidBecomeChanged:);
        default:
            [super selectorForState:state];
    }
    
    return NULL;
}

#pragma mark -
#pragma mark Private

- (void)fillUsers:(NSMutableArray *)users {
    for (NSUInteger index = 0; index < TENUsersCount; index++) {
        [self addObject];
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
