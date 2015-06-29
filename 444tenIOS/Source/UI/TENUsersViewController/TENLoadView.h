//
//  TENLoadView.h
//  444tenIOS
//
//  Created by 444ten on 6/28/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TENLoadView : UIView
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView    *activityIndicator;
@property (nonatomic, strong)   IBOutlet UIButton                   *unlockButton;

+ (instancetype)viewInSuperView:(UIView *)superView;

- (instancetype)initInSuperView:(UIView *)superView;

- (IBAction)onUnlockButton:(id)sender;


- (void)lock;
- (void)unlock;

@end
