//
//  TENLoadingView.h
//  444tenIOS
//
//  Created by 444ten on 6/28/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENLockableViewProtocol.h"

@interface TENLoadingView : UIView <TENLockableViewProtocol>

+ (instancetype)viewInSuperview:(UIView *)superview;

@end
