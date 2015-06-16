//
//  TENSquare.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/16/15.
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

static const CGFloat    sizeSquare  = 50.0;

static const NSTimeInterval TENAnimateDuration  = 1.0;
static const NSTimeInterval TENAnimateDelay     = 0.0;

@interface TENSquare : NSObject
@property (nonatomic, assign)   TENSquarePosition   position;
@property (nonatomic, assign)   TENSquarePosition   targetPosition;

- (TENSquarePosition)targetPositionRandom:(BOOL)random;
- (CGRect)frameForPosition:(TENSquarePosition)position inSuperviewFrame:(CGRect)superviewFrame;


@end
