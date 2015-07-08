//
//  TENModel.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/4/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENModel.h"

@implementation TENModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        TENModelState state = self.state;
        if (TENModelWillLoad == state || TENModelLoaded == state) {
            self.state = state;
            return;
        }
        
        self.state = TENModelWillLoad;
    }
    
    [self setupLoading];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [self performLoadingInBackground];
    });
}

- (void)setupLoading {
    
}

- (void)performLoadingInBackground {
    
}

#pragma mark -
#pragma mark Overload

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TENModelUnloaded:
            return @selector(modelDidUnload:);
        case TENModelWillLoad:
            return @selector(modelWillLoad:);
        case TENModelLoaded:
            return @selector(modelDidLoad:);
        case TENModelFailLoading:
            return @selector(modelDidFailLoad:);
        case TENModelChanged:
            return @selector(model:didChangeWithUsersInfo:);
            
        default:
            [super selectorForState:state];
    }
    
    return NULL;
}

@end
