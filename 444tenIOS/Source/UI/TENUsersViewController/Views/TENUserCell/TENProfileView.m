//
//  TENProfileView.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/15/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENProfileView.h"

#import "TENImage.h"
#import "TENMacro.h"
#import "TENThread.h"

static NSString * const kTENFailImageName   = @"cat.jpg";

@implementation TENProfileView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.profileImage = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setProfileImage:(TENImage *)profileImage {
    if (_profileImage != profileImage) {
        [_profileImage removeObserver:self];
        
        _profileImage = profileImage;
        [_profileImage addObserver:self];
        
        self.locked = YES;
        [_profileImage load];
    }
}

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(TENImage *)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        
//        self.profileImageView.image = self.profileImage.image;
        self.profileImageView.image = model.image;
        self.locked = NO;
    });
}

- (void)modelDidFailLoad:(id)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        
        self.profileImageView.image = [UIImage imageNamed:kTENFailImageName];
        self.locked = NO;
    });
}


@end
