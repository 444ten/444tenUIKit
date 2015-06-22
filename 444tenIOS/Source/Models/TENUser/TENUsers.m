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
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return [self.users count];
}

- (void)addObject {
    TENUser *user = [TENUser new];
    user.name = [NSString stringWithFormat:@"User_%lu", [self count]];
    [self.users addObject:user];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.users removeObjectAtIndex:index];
}

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    [self.users moveObjectAtIndex:fromIndex toIndex:toIndex];
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
    [self.users exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.users[index];
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
