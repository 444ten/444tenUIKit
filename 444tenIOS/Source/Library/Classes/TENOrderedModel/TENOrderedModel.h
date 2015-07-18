//
//  TENOrderedModel.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/7/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENModel.h"

@interface TENOrderedModel : TENModel <NSFastEnumeration>
@property (nonatomic, readonly)   NSArray  *objects;

- (NSUInteger)count;

- (id)objectAtIndex:(NSUInteger)index;

- (void)addObject:(id)object;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
- (void)removeAllObjects;
- (void)addObjectsFromArray:(NSArray *)array;

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
