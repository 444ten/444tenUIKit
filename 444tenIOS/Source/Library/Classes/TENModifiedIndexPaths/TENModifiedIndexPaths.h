//
//  TENModifiedIndexPaths.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/23/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TENModifiedIndexPaths : NSObject
@property (nonatomic, strong)   NSArray *insertingPaths;
@property (nonatomic, strong)   NSArray *deletingPaths;
@property (nonatomic, strong)   NSArray *reloadingPaths;

- (void)addInsertingIndex:(NSUInteger)index;
- (void)addDeletingIndex:(NSUInteger)index;
- (void)addReloadingIndex:(NSUInteger)index;

- (void)reset;

@end
