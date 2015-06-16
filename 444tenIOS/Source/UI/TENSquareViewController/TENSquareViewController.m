//
//  TENSquareViewController.m
//  TENSquare
//
//  Created by Andrey Ten on 6/11/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENSquareViewController.h"

#import "TENMainView.h"
#import "TENSquareView.h"

@interface TENSquareViewController ()
@property (nonatomic, readonly) TENMainView *mainView;

@end

@implementation TENSquareViewController

@dynamic mainView;

#pragma mark -
#pragma mark Accessors

- (TENMainView *)mainView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[TENMainView class]]) {
        return (TENMainView *)self.view;
    }
    
    return nil;
}

#pragma mark - 
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onNextButton:(id)sender {
    TENSquareView *square = self.mainView.squareView;
    TENSquarePosition position = (square.position + 1) % TENPositionCount;
    
    [square setPosition:position];
    
//    [square setPosition:position animated:NO];
}

@end
