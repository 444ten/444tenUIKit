//
//  TENMainView.m
//  TENSquare
//
//  Created by 444ten on 6/13/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENMainView.h"

@implementation TENMainView

#pragma mark -
#pragma mark Public

- (void)updateStartStopButtonForMovingState:(BOOL)moving {
    [self.startStopButton setTitle:moving ? @"start" : @"stop" forState:UIControlStateNormal];
}

@end
