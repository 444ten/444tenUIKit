//
//  TENLockableView.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/9/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENLockableViewProtocol.h"

@interface TENLockableView : UIView
@property (nonatomic, strong)   UIView<TENLockableViewProtocol> *lockingView;

@property (nonatomic, assign, getter=isLocked)  BOOL    locked;

@end
