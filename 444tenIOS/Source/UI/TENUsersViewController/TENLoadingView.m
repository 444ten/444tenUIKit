//
//  TENLoadingView.m
//  444tenIOS
//
//  Created by 444ten on 6/28/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//


#import "TENLoadingView.h"

#import "UINib+TENExtensions.h"

static const NSTimeInterval TENAnimateDuration  = 0.5;
static const CGFloat        TENLockAlpha        = 0.7;
static const CGFloat        TENUnlockAlpha      = 0.0;

@implementation TENLoadingView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)viewInSuperview:(UIView *)superview {
    TENLoadingView *result = [UINib objectWithClass:[self class]];
    result.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [superview addSubview:result];
    
    return result;
}

#pragma mark -
#pragma mark Public

- (BOOL)isUnlock{
    return TENUnlockAlpha == self.alpha;
}

- (void)lock {
    [self.activityIndicator startAnimating];
    
    [UIView animateWithDuration:TENAnimateDuration
                     animations:^{
                         self.alpha = TENLockAlpha;
                     }];
}

- (void)unlock {
    [UIView animateWithDuration:TENAnimateDuration
                     animations:^{
                         self.alpha = TENUnlockAlpha;
                     }
                     completion:^(BOOL finished) {
                         [self.activityIndicator stopAnimating];
                     }];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onUnlockButton:(id)sender {
    [self unlock];
}

@end
