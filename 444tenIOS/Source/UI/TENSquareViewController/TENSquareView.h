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
@property (nonatomic, strong)                   TENSquareModel  *square;
@property (nonatomic, assign, getter=isMoving)  BOOL            moving;

- (void)setMoving:(BOOL)moving updateState:(void (^)(BOOL finished))updateBlock;

- (void)setTargetPosition:(TENSquarePosition)targetPosition;
- (void)setTargetPosition:(TENSquarePosition)targetPosition
                 animated:(BOOL)animated;
- (void)setTargetPosition:(TENSquarePosition)targetPosition
                 animated:(BOOL)animated
        completionHandler:(void (^)(BOOL finished))completion;

- (void)moveToNextPositionAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;
- (void)moveToRandomPositionAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

@end
