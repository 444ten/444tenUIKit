//
//  UIWindow+TENExtensions.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/20/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "UIWindow+TENExtensions.h"

@implementation UIWindow (TENExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
