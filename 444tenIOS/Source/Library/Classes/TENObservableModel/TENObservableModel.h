//
//  TENObservableModel.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/4/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENObservableObject.h"

typedef NS_ENUM(NSUInteger, TENModelState) {
    TENModelUnloaded,
    TENModelWillLoad,
    TENModelLoaded,
    TENModelFailLoading,
    TENModelChanged
};

@protocol TENModelObserver

@optional
- (void)model:(id)model didUnloadWithUsersInfo:(id)userInfo;
- (void)model:(id)model willLoadWithUsersInfo:(id)userInfo;
- (void)model:(id)model didLoadWithUsersInfo:(id)userInfo;
- (void)model:(id)model didFailLoadWithUsersInfo:(id)userInfo;
- (void)model:(id)model didChangeWithUsersInfo:(id)userInfo;

@end

@interface TENObservableModel : TENObservableObject

- (void)load;

// This method is intended for subclassing. Never call it directly.
- (void)setupLoading;

// This method is intended for subclassing. Never call it directly.
// You should set state
- (void)performLoadingInBackground;

@end
