//
//  TENLoadingView.m
//  444tenIOS
//
//  Created by 444ten on 6/28/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENLoadingView.h"

#import "NSBundle+TENExtensions.h"
#import "UIView+TENExtensions.h"

static const NSTimeInterval TENAnimateDuration  = 0.5;
static const CGFloat        TENLockAlpha        = 1.0;
static const CGFloat        TENUnlockAlpha      = 0.0;

@implementation TENLoadingView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)viewInSuperview:(UIView *)superview {
    TENLoadingView *result = [[NSBundle mainBundle] objectWithClass:[self class]];
    result.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [superview addSubview:result];
    
    return result;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.alpha = TENUnlockAlpha;
}

#pragma mark -
#pragma mark Accessors

- (void)setLocked:(BOOL)locked {
    [self setLocked:locked animated:NO];
}

- (void)setLocked:(BOOL)locked animated:(BOOL)animated {
    [UIView animateWithDuration: animated ? TENAnimateDuration : 0
                     animations:^{ self.alpha = locked ? TENLockAlpha : TENUnlockAlpha; }
                     completion:^(BOOL finished) {
                         if (finished) {
                             _locked = locked;
                         }
                     }];
}

@end
