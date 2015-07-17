//
//  TENUser.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENImageModel.h"

@interface TENUser : NSObject <NSCoding>
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, strong)   TENImageModel   *imageModel;

@end
