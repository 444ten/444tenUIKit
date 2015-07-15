//
//  TENAvatarView.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/15/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENAvatarView.h"

#import "TENImage.h"
#import "TENMacro.h"
#import "TENThread.h"

static NSString * const kTENFailImageName   = @"cat.jpg";

@implementation TENAvatarView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.avatarImage = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setAvatarImage:(TENImage *)avatarImage {
    if (_avatarImage != avatarImage) {
        [_avatarImage removeObserver:self];
        
        _avatarImage = avatarImage;
        [_avatarImage addObserver:self];
        
        self.locked = YES;
        [_avatarImage load];
    }
}

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(id)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        
        self.avatarImageView.image = self.avatarImage.image;
        self.locked = NO;
    });
}

- (void)modelDidFailLoad:(id)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        
        self.avatarImageView.image = [UIImage imageNamed:kTENFailImageName];
        self.locked = NO;
    });
}


@end
