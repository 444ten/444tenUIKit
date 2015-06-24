//
//  TENChangedPath.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/23/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENChangedPath.h"

@interface TENChangedPath ()
@property (nonatomic, assign) TENPathType     pathType;
@property (nonatomic, strong) NSIndexPath     *path;

@end

@implementation TENChangedPath

#pragma mark -
#pragma mark Class Methods

+ (instancetype)insertingPathWithIndex:(NSUInteger)index {
    return [[self alloc] initWithIndex:index pathType:TENPathTypeInserting];
}

+ (instancetype)deletingPathWithIndex:(NSUInteger)index {
    return [[self alloc] initWithIndex:index pathType:TENPathTypeDeleting];
}

+ (instancetype)reloadingPathWithIndex:(NSUInteger)index {
    return [[self alloc] initWithIndex:index pathType:TENPathTypeReloading];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithIndex:(NSUInteger)index pathType:(TENPathType)pathType {
    self = [super init];
    if (self) {
        self.pathType = pathType;
        self.path = [NSIndexPath indexPathForRow:index inSection:0];
    }
    
    return self;
}

@end
