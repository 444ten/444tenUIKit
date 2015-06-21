//
//  TENUsers.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TENUser;

@interface TENUsers : NSObject <NSFastEnumeration>

- (NSUInteger)count;

- (void)addObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
