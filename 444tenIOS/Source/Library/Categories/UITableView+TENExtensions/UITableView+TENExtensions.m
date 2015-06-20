//
//  UITableView+TENExtensions.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/20/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "UITableView+TENExtensions.h"

#import "UINib+TENExtensions.h"

@implementation UITableView (TENExtensions)

#pragma mark -
#pragma mark Public

- (id)cellWithClass:(Class)cls {
    return [self cellWithClass:cls bundle:nil owner:nil options:nil];
}

- (id)cellWithClass:(Class)cls
             bundle:(NSBundle *)bundle
              owner:(id)owner
            options:(NSDictionary *)options
{
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
    if (!cell) {
        cell = [UINib objectWithClass:cls bundle:bundle owner:owner options:options];
    }
    
    return cell;
}

@end
