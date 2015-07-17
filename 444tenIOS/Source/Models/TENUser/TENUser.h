//
//  TENUser.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TENImageModel;

@interface TENUser : NSObject <NSCoding>
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, strong)   NSURL           *imageUrl;
@property (nonatomic, readonly) TENImageModel   *imageModel;

@end
