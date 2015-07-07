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

@interface TENLoadingView ()
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView    *activityIndicator;

- (TENAnimationsBlock)animationsWithLocked:(BOOL)locked;
- (void)completionWithLocked:(BOOL)locked;

@end

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
#pragma mark Accessors

- (void)setLocked:(BOOL)locked {
    [self setLocked:locked animated:NO];
}

- (void)setLocked:(BOOL)locked animated:(BOOL)animated {
    if (_locked != locked) {
        [UIView animateWithDuration: animated ? TENAnimateDuration : 0
                         animations:[self animationsWithLocked:locked]
                         completion:^(BOOL finished) {
                             [self completionWithLocked:locked];
                             if (finished) {
                                 _locked = locked;
                             }
                         }];
    }
}

#pragma mark -
#pragma mark Private

- (TENAnimationsBlock)animationsWithLocked:(BOOL)locked {
    return ^{ self.alpha = locked ? TENLockAlpha : TENUnlockAlpha; };
    
}

- (void)completionWithLocked:(BOOL)locked {
    if (locked) {
        [self.activityIndicator startAnimating];
    } else {
        [self.activityIndicator stopAnimating];
    }
}

@end
