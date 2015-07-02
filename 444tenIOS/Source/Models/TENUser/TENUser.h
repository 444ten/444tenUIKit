//
//  TENUser.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENObservableObject.h"

typedef NS_ENUM(NSUInteger, TENModelState) {
    TENModelUnloaded,
    TENModelLoading,
    TENModelLoaded,
    TENModelFailingLoading
};

@protocol TENModelObserver

@optional

- (void)model:(id)model didLoadWithUsersInfo:(id)userInfo;

@end

@interface TENUser : TENObservableObject <NSCoding>
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, readonly) UIImage     *userImage;

- (void)loadUserImage;

@end
