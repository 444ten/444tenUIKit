//
//  TENUserCell.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/19/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUserCell.h"

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
    self.nameLabel.text = user.name;
    [user loadUserImage];
}

#pragma mark -
#pragma mark TENModelObserver

- (void)model:(TENUser *)model didLoadWithUsersInfo:(id)userInfo {
    __weak TENUserCell *weakSelf = self;
    
    TENPerformOnMainThreadWithBlock(^{
        __strong TENUserCell *strongSelf = weakSelf;
        
        [strongSelf.activityIndicator stopAnimating];
        strongSelf.userImageView.image = model.userImage;
    });
}


@end
