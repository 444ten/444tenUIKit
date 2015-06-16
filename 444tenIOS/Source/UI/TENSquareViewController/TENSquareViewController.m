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

- (TENSquarePosition)randomTargetPosition;

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
    TENSquarePosition position = (square.targetPosition + 1) % TENPositionCount;
    
    [square setTargetPosition:position animated:YES];
}

- (IBAction)onRandomButton:(id)sender {
    [self.mainView.squareView setTargetPosition:[self randomTargetPosition] animated:YES];
}

- (TENSquarePosition)randomTargetPosition {
    TENSquarePosition result = arc4random_uniform(TENPositionCount);
    if (result == self.mainView.squareView.targetPosition) {
        return [self randomTargetPosition];
    }
    
    return result;
}

@end
