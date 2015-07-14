//
//  TENUser.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENModel.h"

#import "TENImage.h"

@interface TENUser : TENModel <NSCoding, TENModelObserver>
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, strong)   TENImage    *userImage;

@end
