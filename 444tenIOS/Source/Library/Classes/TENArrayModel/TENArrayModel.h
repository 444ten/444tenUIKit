//
//  TENArrayModel.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/7/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENObservableModel.h"

@interface TENArrayModel : TENObservableModel <NSFastEnumeration>
@property (nonatomic, strong)   NSMutableArray  *array;

- (NSUInteger)count;

- (id)objectAtIndex:(NSUInteger)index;

- (void)addObject:(id)object;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
