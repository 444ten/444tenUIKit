//
//  TENChangedPath.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/23/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TENPathType) {
    TENPathTypeInserting,
    TENPathTypeDeleting,
    TENPathTypeReloading
};

@interface TENChangedPath : NSObject
@property (nonatomic, readonly) TENPathType     pathType;
@property (nonatomic, readonly) NSIndexPath     *path;

+ (instancetype)insertingPathWithIndex:(NSUInteger)index;
+ (instancetype)deletingPathWithIndex:(NSUInteger)index;
+ (instancetype)reloadingPathWithIndex:(NSUInteger)index;

- (instancetype)initWithIndex:(NSUInteger)index pathType:(TENPathType)pathType;

@end
