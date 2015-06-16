//
//  TENMainView.h
//  TENSquare
//
//  Created by 444ten on 6/13/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TENSquareView;

@interface TENMainView : UIView
@property (nonatomic, strong)   IBOutlet TENSquareView  *squareView;
@property (nonatomic, strong)   IBOutlet UIButton       *nextButton;
@property (nonatomic, strong)   IBOutlet UIButton       *randomButton;

@end
