//
//  TENUserView.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/15/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENLockableView.h"

@class TENImageModel;

@interface TENUserView : TENLockableView
@property (nonatomic, strong)   IBOutlet UIImageView    *userImageView;

@property (nonatomic, strong)   TENImageModel    *userImageModel;

- (void)fillWithModel:(TENImageModel *)model;


@end
