//
//  TENSquareViewController.h
//  TENSquare
//
//  Created by Andrey Ten on 6/11/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TENSquareModel;

@interface TENSquareViewController : UIViewController
@property (nonatomic, strong)   TENSquareModel  *square;

- (IBAction)onNextButton:(id)sender;
- (IBAction)onRandomButton:(id)sender;
- (IBAction)onStartStopButton:(id)sender;

@end
