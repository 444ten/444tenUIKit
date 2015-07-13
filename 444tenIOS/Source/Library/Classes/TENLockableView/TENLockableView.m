//
//  TENLockableView.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/9/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENLockableView.h"

#import "TENLoadingView.h"

@interface TENLockableView ()

@end

@implementation TENLockableView

@dynamic locked;

- (void)setLocked:(BOOL)locked {
    [self.loadingView setLocked:locked animated:YES];
}

- (BOOL)isLocked {
    return self.loadingView.isLocked;
}

@end
