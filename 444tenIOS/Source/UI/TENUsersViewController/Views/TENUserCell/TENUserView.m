//
//  TENUserView.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/15/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUserView.h"

#import "TENImageModel.h"
#import "TENMacro.h"
#import "TENThread.h"

static const BOOL TENLoadingViewAnimated    = NO;

@implementation TENUserView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.userImageModel = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUserImageModel:(TENImageModel *)userImageModel {
    if (_userImageModel != userImageModel) {
        [_userImageModel removeObserver:self];
        
        _userImageModel = userImageModel;
        [_userImageModel addObserver:self];
        
        [self setLocked:YES animated:TENLoadingViewAnimated];
        
        [self fillWithModel:userImageModel];
        [_userImageModel load];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TENImageModel *)model {
    self.userImageView.image = model.image;
}

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(TENImageModel *)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        [self fillWithModel:model];
        [self setLocked:NO animated:TENLoadingViewAnimated];
    });
}

@end
