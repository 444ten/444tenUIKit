//
//  TENAvatarView.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/15/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENLockableView.h"

@class TENImage;

@interface TENAvatarView : TENLockableView
@property (nonatomic, strong)   IBOutlet UIImageView    *avatarImageView;

@property (nonatomic, strong)   TENImage    *avatarImage;

@end
