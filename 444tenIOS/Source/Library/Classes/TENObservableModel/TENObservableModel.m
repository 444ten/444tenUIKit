//
//  TENObservableModel.m
//  444tenIOS
//
//  Created by Andrey Ten on 7/4/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENObservableModel.h"

@implementation TENObservableModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        if (TENModelLoaded == self.state) {
            self.state = TENModelLoaded;
            return;
        }
        
        self.state = TENModelWillLoad;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [self performLoadingInBackground];
    });
}

- (void)performLoadingInBackground {
    
}

#pragma mark -
#pragma mark Overload

- (SEL)selectorForState:(NSUInteger)state withObject:(id)object {
    switch (state) {
        case TENModelUnloaded:
            return @selector(model:didUnloadWithUsersInfo:);
        case TENModelWillLoad:
            return @selector(model:startedLoadWithUsersInfo:);
        case TENModelLoaded:
            return @selector(model:didLoadWithUsersInfo:);
        case TENModelFailLoading:
            return @selector(model:didFailLoadWithUsersInfo:);
        case TENModelChanged:
            return @selector(model:didChangeWithUsersInfo:);
            
        default:
            [super selectorForState:state withObject:object];
    }
    
    return NULL;
}

@end
