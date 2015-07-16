//
//  UITableView+TENExtensions.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/20/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "UITableView+TENExtensions.h"

#import "TENChangedPath.h"

#import "UINib+TENExtensions.h"

@implementation UITableView (TENExtensions)

#pragma mark -
#pragma mark Public

- (id)cellWithClass:(Class)cls {
    return [self cellWithClass:cls owner:nil options:nil];
}

- (id)cellWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    return [self cellWithClass:cls bundle:nil owner:owner options:options];
}

- (id)cellWithClass:(Class)cls
             bundle:(NSBundle *)bundle
              owner:(id)owner
            options:(NSDictionary *)options
{
    id cell = [self dequeueReusableCellWithClass:cls];
    if (!cell) {
        cell = [UINib objectWithClass:cls bundle:bundle owner:owner options:options];
    }
    
    return cell;
}

- (id)dequeueReusableCellWithClass:(Class)cls {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
}

- (void)updateTableViewWithChangedPath:(TENChangedPath *)changedPath {
    NSArray *paths = @[changedPath.path];
    
    switch (changedPath.pathType) {
        case TENPathTypeInserting: {
            [self insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationLeft];
            [self scrollToRowAtIndexPath:changedPath.path
                        atScrollPosition:UITableViewScrollPositionBottom
                                animated:YES];
            break;
        }
        case TENPathTypeDeleting:
            [self deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationLeft];
            break;
        case TENPathTypeReloading:
            [self reloadRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationRight];
            break;
            
        default:
            break;
    }
}

@end
