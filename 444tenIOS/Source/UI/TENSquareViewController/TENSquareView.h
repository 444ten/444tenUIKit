//
//  TENSquareView.h
//  TENSquare
//
//  Created by 444ten on 6/14/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TENSquarePosition) {
    TENPositionLeftUp,
    TENPositionRightUp,
    TENPositionRightDown,
    TENPositionLeftDown,
    TENPositionCount
};

@interface TENSquareView : UIView
@property (nonatomic, assign)   TENSquarePosition   position;
@property (nonatomic, assign)   TENSquarePosition   targetPosition;

- (void)setTargetPosition:(TENSquarePosition)targetPosition animated:(BOOL)animated;
- (void)setTargetPosition:(TENSquarePosition)targetPosition
                 animated:(BOOL)animated
        completionHandler:(void (^)(BOOL finished))completion;

@end
