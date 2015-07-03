//
//  TENLoadingView.m
//  444tenIOS
//
//  Created by 444ten on 6/28/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENLoadingView.h"

#import "NSBundle+TENExtensions.h"

static const NSTimeInterval TENAnimateDuration  = 0.5;
static const CGFloat        TENLockAlpha        = 0.7;
static const CGFloat        TENUnlockAlpha      = 0.0;

@interface TENLoadingView ()
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView    *activityIndicator;

- (void)lock;
- (void)unlock;

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
        
        if (locking) {
            [self lock];
        } else
            [self unlock];
    }
}

//#pragma mark -
//#pragma mark Public
//
//- (void)lockUnlock:(BOOL)locking {
//    void(^completionBlock)(void) = nil;
//    
//    if (locking) {
//        _locking = YES;
//        [self.activityIndicator startAnimating];
//    } else {
//        completionBlock = ^{
//            [self.activityIndicator stopAnimating];
//            _locking = NO;
//        };
//    }
//    
//    [UIView animateWithDuration: TENAnimateDuration
//                     animations:^{
//                         self.alpha = locking ? TENLockAlpha : TENUnlockAlpha;
//                     }
//                     completion:^(BOOL finished) {
//                        completionBlock();
//                     }];
//}

- (void)lock {
    _locking = YES;
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
                         _locking = NO;
                     }];
}

@end
