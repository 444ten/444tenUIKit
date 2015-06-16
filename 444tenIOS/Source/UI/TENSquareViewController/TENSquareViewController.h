//
//  TENSquareViewController.h
//  TENSquare
//
//  Created by Andrey Ten on 6/11/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TENSquare;

@interface TENSquareViewController : UIViewController
@property (nonatomic, strong)   TENSquare   *square;

- (IBAction)onNextButton:(id)sender;
- (IBAction)onRandomButton:(id)sender;

@end
