//
//  TENUsers.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TENObservableObject.h"

typedef NS_ENUM(NSUInteger, TENUsersState) {
    TENUsersChanged
};

@class TENUsers;

@protocol TENUsersObserver <NSObject>

@optional

- (void)usersChanged:(TENUsers *)users;

@end

@interface TENUsers : TENObservableObject <NSFastEnumeration>

- (NSUInteger)count;

- (id)objectAtIndex:(NSUInteger)index;

- (void)addObject:(id)object;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
