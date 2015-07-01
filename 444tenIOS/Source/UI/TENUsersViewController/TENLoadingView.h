//
//  TENLoadingView.h
//  444tenIOS
//
//  Created by 444ten on 6/28/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TENLoadingView : UIView
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView    *activityIndicator;
@property (nonatomic, strong)   IBOutlet UIButton                   *unlockButton;

+ (instancetype)viewInSuperview:(UIView *)superview;

- (IBAction)onUnlockButton:(id)sender;

- (BOOL)isUnlock;

- (void)lock;
- (void)unlock;

@end
