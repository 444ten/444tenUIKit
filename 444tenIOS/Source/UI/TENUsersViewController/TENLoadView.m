//
//  TENLoadView.m
//  444tenIOS
//
//  Created by 444ten on 6/28/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//


#import "TENLoadView.h"

#import "UINib+TENExtensions.h"

static const NSTimeInterval TENAnimateDuration  = 0.5;
static const CGFloat        TENLockAlpha        = 0.7;
static const CGFloat        TENUnlockAlpha      = 0.0;

@implementation TENLoadView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)viewInSuperView:(UIView *)superView {
    return [[self alloc] initInSuperView:superView];
}

#pragma mark - 
#pragma mark Initialization and Deallocations

- (instancetype)initInSuperView:(UIView *)superView {
    self = [super init];
    if (self) {
        self = [UINib objectWithClass:[self class]];
    }
    
    [superView addSubview:self];
    
    return self;
}

#pragma mark -
#pragma mark Public

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
