//
//  TENSquareViewController.m
//  TENSquare
//
//  Created by Andrey Ten on 6/11/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENSquareViewController.h"

#import "TENMainView.h"
#import "TENSquare.h"
#import "TENSquareView.h"

@interface TENSquareViewController ()
@property (nonatomic, readonly) TENMainView *mainView;

- (void)changeSquareTargetPositionRandom:(BOOL)random;

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
    [self changeSquareTargetPositionRandom:NO];
}

- (IBAction)onRandomButton:(id)sender {
    [self changeSquareTargetPositionRandom:YES];
}

#pragma mark -
#pragma mark Interface Handling

- (void)changeSquareTargetPositionRandom:(BOOL)random {
    TENSquare *square = self.square;
    TENSquareView *squareView = self.mainView.squareView;
    
    squareView.square = square;
    [squareView setTargetPosition:[square targetPositionRandom:random] animated:YES];
    
}

@end
