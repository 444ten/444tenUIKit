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
static const CGFloat        TENLockAlpha        = 0.7;
static const CGFloat        TENUnlockAlpha      = 0.0;

@interface TENLoadingView ()
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView    *activityIndicator;

- (void)lock:(BOOL)locking;

- (TENAnimationsBlock)animationsWithLocking:(BOOL)locking;
- (TENCompletionBlock)completionWithLocking:(BOOL)locking;

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

- (void)setLocking:(BOOL)locking {
    if (_locking != locking) {
        [self lock:locking];
    }
}

#pragma mark -
#pragma mark Private

- (void)lock:(BOOL)locking {
    if (locking) {
        _locking = YES;
        [self.activityIndicator startAnimating];
    }
    
    [UIView animateWithDuration:TENAnimateDuration
                     animations:[self animationsWithLocking:locking]
                     completion:[self completionWithLocking:locking]];
}

- (TENAnimationsBlock)animationsWithLocking:(BOOL)locking {
    return ^{ self.alpha = locking ? TENLockAlpha : TENUnlockAlpha; };
    
}

- (TENCompletionBlock)completionWithLocking:(BOOL)locking {
    TENCompletionBlock unlockingBlock = ^(BOOL finished){
                                            [self.activityIndicator stopAnimating];
                                            _locking = NO;
                                        };
    
    return locking ? nil : unlockingBlock;
}

@end
