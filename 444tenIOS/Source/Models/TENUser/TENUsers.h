//
//  TENUsers.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TENObservableModel.h"

@interface TENUsers : TENObservableModel <NSFastEnumeration>

+ (instancetype)sharedUsers;

- (NSUInteger)count;

- (id)objectAtIndex:(NSUInteger)index;

- (void)addObject:(id)object;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)load;
- (void)save;

@end
