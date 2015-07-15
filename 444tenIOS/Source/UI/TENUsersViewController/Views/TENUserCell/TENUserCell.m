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

@interface TENUserCell ()
@property (nonatomic, retain)   IBOutlet TENAvatarView   *avatarView;

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
        
        self.avatarView.locked = YES;

        [self fillWithModel:user];
        [user load];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TENUser *)user {
    self.nameLabel.text = user.name;
    self.avatarView.avatarImageView.image = user.userImage.image;
}

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(id)model {
    TENWeakify(self)
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        
        [self fillWithModel:model];
        self.avatarView.locked = NO;
    });
}



@end
