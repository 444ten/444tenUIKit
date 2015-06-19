//
//  TENSquareViewController.m
//  TENSquare
//
//  Created by Andrey Ten on 6/11/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENSquareViewController.h"

#import "TENMacro.h"
#import "TENMainView.h"
#import "TENSquareModel.h"
#import "TENSquareView.h"

typedef void(^TENPositionBlock)(BOOL);

TENViewControllerBaseViewProperty(TENSquareViewController, mainView, TENMainView)

@interface TENSquareViewController ()

- (TENPositionBlock)positionBlock;

@end

@implementation TENSquareViewController

#pragma mark -
#pragma mark Accessors

- (void) setSquare:(TENSquareModel *)square {
    if (_square != square) {
        _square = square;
    }
    
    self.mainView.squareView.square = square;    
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
    [self.mainView.squareView moveToNextPositionAnimated:YES completion:[self positionBlock]];
}

- (IBAction)onRandomButton:(id)sender {
    [self.mainView.squareView moveToRandomPositionAnimated:YES completion:[self positionBlock]];
}

- (IBAction)onStartStopButton:(id)sender {
    TENSquareView *squareView = self.mainView.squareView;
    BOOL isMoving = squareView.isMoving;
    
    [squareView setMoving:!isMoving updateState:[self positionBlock]];
    
    [self.mainView updateStartStopButtonForMovingState:isMoving];
}

#pragma mark -
#pragma mark Private

- (TENPositionBlock)positionBlock {
    TENSquareModel *square = self.square;
    
    return ^(BOOL finished) {
        if (finished) {
            square.position = square.targetPosition;
        }
    };
}

@end
