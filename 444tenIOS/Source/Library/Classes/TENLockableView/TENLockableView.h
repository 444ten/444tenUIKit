//
//  TENLockableView.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/9/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENLoadingViewProtocol.h"

@interface TENLockableView : UIView
@property (nonatomic, strong)   IBOutlet UIView<TENLoadingViewProtocol> *loadingView;

@property (nonatomic, readonly)                 Class   loadingViewClass;
@property (nonatomic, assign, getter=isLocked)  BOOL    locked;

- (void)setLocked:(BOOL)locked animated:(BOOL)animated;

@end
