//
//  NSMutableArray+TENExtensions.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/22/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "NSMutableArray+TENExtensions.h"

@implementation NSMutableArray (TENExtensions)

#pragma mark -
#pragma mark Public

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    id object = self[fromIndex];
    [self removeObjectAtIndex:fromIndex];
    [self insertObject:object atIndex:toIndex];
}

@end
