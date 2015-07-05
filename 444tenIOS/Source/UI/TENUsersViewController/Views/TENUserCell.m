//
//  TENUserCell.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/19/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUserCell.h"

#import "TENMacro.h"
#import "TENThread.h"


@implementation TENUserCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.user = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(TENUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        
        _user = user;
        [_user addObserver:self];
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TENUser *)user {
    [self.activityIndicator startAnimating];
    self.nameLabel.text = user.name;
    [user load];
}

#pragma mark -
#pragma mark TENModelObserver

- (void)model:(TENUser *)model didLoadWithUsersInfo:(id)userInfo {
    TENWeakify(self)
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        
        [self.activityIndicator stopAnimating];
        self.userImageView.image = model.userImage;
    });
}


@end
