//
//  TENLoadingViewProtocol.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/9/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TENLoadingViewProtocol <NSObject>
@property (nonatomic, assign, getter=isLocked)  BOOL    locked;

+ (instancetype)viewInSuperview:(UIView *)superview;

- (void)setLocked:(BOOL)locked animated:(BOOL)animated;

@end
