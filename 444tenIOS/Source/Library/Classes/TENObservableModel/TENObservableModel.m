//
//  TENObservableModel.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/4/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENObservableModel.h"

@interface TENObservableModel ()

- (void)notifyWithState:(TENModelState)state;

@end

@implementation TENObservableModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        TENModelState state = self.state;
        if (TENModelWillLoad == state || TENModelLoaded == state) {
            [self notifyWithState:state];
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
#pragma mark Private

- (void)notifyWithState:(TENModelState)state {
    self.state = state;
}

#pragma mark -
#pragma mark Overload

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case TENModelUnloaded:
            return @selector(model:didUnloadWithUsersInfo:);
        case TENModelWillLoad:
            return @selector(model:willLoadWithUsersInfo:);
        case TENModelLoaded:
            return @selector(model:didLoadWithUsersInfo:);
        case TENModelFailLoading:
            return @selector(model:didFailLoadWithUsersInfo:);
        case TENModelChanged:
            return @selector(model:didChangeWithUsersInfo:);
            
        default:
            [super selectorForState:state];
    }
    
    return NULL;
}

@end
