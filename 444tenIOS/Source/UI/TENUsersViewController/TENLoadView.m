//
//  TENLoadView.m
//  444tenIOS
//
//  Created by 444ten on 6/28/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

static const double TENAnimateDuration  = 0.5;

#import "TENLoadView.h"

#import "UINib+TENExtensions.h"

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
                         self.alpha = 0.7;
                     }];
}

- (void)unlock {
    [UIView animateWithDuration:TENAnimateDuration
                     animations:^{
                         self.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self.activityIndicator stopAnimating];
                         }
                     }];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onUnlockButton:(id)sender {
    [self unlock];
}
@end
