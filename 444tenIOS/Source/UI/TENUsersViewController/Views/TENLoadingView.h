//
//  TENLoadingView.h
//  444tenIOS
//
//  Created by 444ten on 6/28/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TENLoadingView : UIView
@property (nonatomic, assign, getter=isLocking)  BOOL    locking;

+ (instancetype)viewInSuperview:(UIView *)superview;

@end
