//
//  TENArrayModel.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/7/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENArrayModel.h"

#import "NSMutableArray+TENExtensions.h"

#import "TENChangedPath.h"

@implementation TENArrayModel

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return [self.array count];
}

- (id)objectAtIndex:(NSUInteger)index {
    return [self.array objectAtIndex:index];
}

- (void)addObject:(id)object {
    [self.array addObject:object];
    [self setState:TENModelChanged withObject:[TENChangedPath insertingPathWithIndex:[self count] - 1]];
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    [self.array insertObject:object atIndex:index];
    [self setState:TENModelChanged withObject:[TENChangedPath insertingPathWithIndex:index]];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.array removeObjectAtIndex:index];
    [self setState:TENModelChanged withObject:[TENChangedPath deletingPathWithIndex:index]];
}

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    [self.array moveObjectAtIndex:fromIndex toIndex:toIndex];
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index {
    [self.array setObject:object atIndexedSubscript:index];
    [self setState:TENModelChanged withObject:[TENChangedPath reloadingPathWithIndex:index]];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.array[index];
}

#pragma mark -
#pragma mark NSFastEnumeration protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len
{
    return [self.array countByEnumeratingWithState:state objects:buffer count:len];
}

@end
