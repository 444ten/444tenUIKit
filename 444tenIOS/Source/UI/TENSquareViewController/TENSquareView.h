//
//  TENSquareView.h
//  TENSquare
//
//  Created by 444ten on 6/14/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENSquareModel.h"

@interface TENSquareView : UIView
@property (nonatomic, strong)   TENSquareModel  *square;

- (void)setTargetPosition:(TENSquarePosition)targetPosition;
- (void)setTargetPosition:(TENSquarePosition)targetPosition
                 animated:(BOOL)animated;
- (void)setTargetPosition:(TENSquarePosition)targetPosition
                 animated:(BOOL)animated
        completionHandler:(void (^)(BOOL finished))completion;

@end
