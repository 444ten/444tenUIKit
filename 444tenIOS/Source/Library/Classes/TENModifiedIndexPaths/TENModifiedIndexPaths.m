//
//  TENModifiedIndexPaths.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/23/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENModifiedIndexPaths.h"

#import <UIKit/UIKit.h>

@interface TENModifiedIndexPaths ()
@property (nonatomic, strong)   NSMutableIndexSet *insertingSet;
@property (nonatomic, strong)   NSMutableIndexSet *deletingSet;
@property (nonatomic, strong)   NSMutableIndexSet *reloadingSet;

- (NSArray *)indexPathsFromIndexSet:(NSMutableIndexSet *)indexSet;

@end

@implementation TENModifiedIndexPaths

@dynamic insertingPaths;
@dynamic deletingPaths;
@dynamic reloadingPaths;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.insertingSet = [NSMutableIndexSet indexSet];
        self.deletingSet = [NSMutableIndexSet indexSet];
        self.reloadingSet = [NSMutableIndexSet indexSet];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)insertingPaths {
    return [self indexPathsFromIndexSet:self.insertingSet];
}

- (NSArray *)deletingPaths {
    return [self indexPathsFromIndexSet:self.deletingSet];
}

- (NSArray *)reloadingPaths {
    return [self indexPathsFromIndexSet:self.reloadingSet];
}

#pragma mark -
#pragma mark Public

- (void)addInsertingIndex:(NSUInteger)index {
    [self.insertingSet addIndex:index];
}

- (void)addDeletingIndex:(NSUInteger)index {
    [self.deletingSet addIndex:index];
}

- (void)addReloadingIndex:(NSUInteger)index {
    [self.reloadingSet addIndex:index];
}

#pragma mark -
#pragma mark Private

- (NSArray *)indexPathsFromIndexSet:(NSMutableIndexSet *)indexSet {
    NSMutableArray *result = [NSMutableArray array];
    
    NSUInteger index=[indexSet firstIndex];
    while(index != NSNotFound)    {
        [result addObject:[NSIndexPath indexPathForRow:index inSection:0]];
        index = [indexSet indexGreaterThanIndex: index];
    }

    [indexSet removeAllIndexes];
    
    return result;
}

@end
