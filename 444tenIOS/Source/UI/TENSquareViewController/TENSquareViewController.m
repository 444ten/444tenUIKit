//
//  TENSquareViewController.m
//  TENSquare
//
//  Created by Andrey Ten on 6/11/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENSquareViewController.h"

#import "TENMainView.h"
#import "TENSquareModel.h"
#import "TENSquareView.h"

typedef void(^TENPositionBlock)(BOOL);

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
    
    self.mainView.squareView.square = self.square;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onNextButton:(id)sender {
    [self.mainView.squareView moveToNextPositionWithAnimated:YES completion:[self positionBlock]];
}

- (IBAction)onRandomButton:(id)sender {
    [self.mainView.squareView moveToRandomPositionWithAnimated:YES completion:[self positionBlock]];
}

- (IBAction)onStartStopButton:(id)sender {
    TENSquareView *squareView = self.mainView.squareView;
    BOOL isMoving = squareView.isMoving;
    squareView.moving = !isMoving;
    
    [(UIButton *)sender setTitle:isMoving ? @"start" : @"stop" forState:UIControlStateNormal];
    
    if (!isMoving) {
        [squareView cyclicMoveToNextPositionWithCompletion:[self positionBlock]];
    }
}

- (TENPositionBlock)positionBlock {
    TENSquareModel *square = self.square;
    
    return ^(BOOL finished) {
        if (finished) {
            square.position = square.targetPosition;
        }
    };
}

@end
