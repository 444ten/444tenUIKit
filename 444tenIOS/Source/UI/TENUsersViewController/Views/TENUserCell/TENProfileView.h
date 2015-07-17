//
//  TENProfileView.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/15/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENLockableView.h"

@class TENImageModel;

@interface TENProfileView : TENLockableView
@property (nonatomic, strong)   IBOutlet UIImageView    *profileImageView;

@property (nonatomic, strong)   TENImageModel    *profileImage;

@end
