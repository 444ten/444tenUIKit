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

@synthesize loadingView = _loadingView;

@dynamic loadingViewClass;
@dynamic locked;

#pragma mark -
#pragma mark Accessors

- (Class)loadingViewClass {
    return [TENLoadingView class];
}

- (void)setLoadingView:(UIView<TENLoadingViewProtocol> *)loadingView {
    if (_loadingView != loadingView) {
        [_loadingView removeFromSuperview];
        
        _loadingView = loadingView;
    }
}

- (UIView<TENLoadingViewProtocol> *)loadingView {
    if (nil == _loadingView) {
        _loadingView = [self.loadingViewClass viewInSuperview:self];
    }
    
    return _loadingView;
}

- (void)setLocked:(BOOL)locked {
    [self setLocked:locked animated:YES];
}

- (void)setLocked:(BOOL)locked animated:(BOOL)animated {
    [self.loadingView setLocked:locked animated:animated];
}

- (BOOL)isLocked {
    return self.loadingView.isLocked;
}

@end
