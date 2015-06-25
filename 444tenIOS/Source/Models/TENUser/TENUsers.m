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

static NSString * const kTENUsersArray  = @"kTENUsersArray";

@interface TENUsers ()
@property (nonatomic, strong)   NSMutableArray          *users;

- (NSMutableArray *)loadUsers;

@end

@implementation TENUsers

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedUsers {
    static id sharedUsers = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUsers = [self new];
    });
    
    return sharedUsers;
}

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype)init {
    self = [super init];
    if (self) {
        self.users = [self loadUsers];
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

- (void)saveUsers {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.users] forKey:kTENUsersArray];
    [defaults synchronize];
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

- (NSMutableArray *)loadUsers {
    NSData *userData = [[NSUserDefaults standardUserDefaults] objectForKey:kTENUsersArray];
    if (userData) {
        return [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:userData]];
    }
    
    return [NSMutableArray array];
}

#pragma mark -
#pragma mark NSFastEnumeration protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len {
    return [self.users countByEnumeratingWithState:state objects:buffer count:len];
}

@end
