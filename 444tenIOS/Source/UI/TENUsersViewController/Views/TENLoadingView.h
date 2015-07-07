//
//  TENLoadingView.h
//  444tenIOS
//
//  Created by 444ten on 6/28/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TENLoadingView : UIView
@property (nonatomic, assign, getter=isLocked)  BOOL    locked;

+ (instancetype)viewInSuperview:(UIView *)superview;

- (void)setLocked:(BOOL)locked animated:(BOOL)animated;

@end
