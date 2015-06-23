//
//  TENUser.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TENUser : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, readonly) UIImage     *userImage;

+ (instancetype)testUser;

- (instancetype)initTestUser;

@end
