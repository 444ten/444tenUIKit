//
//  UIViewController+TENExtensions.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/6/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "UIViewController+TENExtensions.h"

@implementation UIViewController (TENExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)controller {
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
