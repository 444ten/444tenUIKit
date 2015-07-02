//
//  NSBundle+TENExtensions.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/1/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "NSBundle+TENExtensions.h"

#import <UIKit/UIKit.h>

@implementation NSBundle (TENExtensions)

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}


- (id)objectWithClass:(Class)cls owner:(id)owner {
    return [self objectWithClass:cls owner:owner options:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [self loadNibNamed:NSStringFromClass(cls) owner:owner options:options];
    for (id object in objects) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}


@end
