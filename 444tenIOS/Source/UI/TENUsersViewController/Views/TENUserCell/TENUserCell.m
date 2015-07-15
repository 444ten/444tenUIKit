//
//  TENUserCell.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/19/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUserCell.h"

#import "TENAvatarView.h"
#import "TENMacro.h"
#import "TENThread.h"

static NSString * const kTENURL = @"http://rsload.net/images4/vin/2014/0707/pri2.jpg";

@interface TENUserCell ()

@end

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
                
        TENImage *userImage = [TENImage imageWithURL:[NSURL URLWithString:kTENURL]];
    
        user.userImage = userImage;
        self.avatarView.avatarImage = userImage;

        [self fillWithModel:user];
        
        [user load];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TENUser *)user {
    self.nameLabel.text = user.name;
}

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(id)model {
    TENWeakify(self)
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        
        [self fillWithModel:model];
    });
}

@end
