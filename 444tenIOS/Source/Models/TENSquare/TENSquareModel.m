//
//  TENSquareModel.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/16/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENSquareModel.h"

@implementation TENSquareModel

#pragma mark -
#pragma mark Public

- (TENSquarePosition)targetPositionRandom:(BOOL)random {
    TENSquarePosition result;
    TENSquarePosition targetPosition = self.targetPosition;
    
    if (random) {
        result = arc4random_uniform(TENPositionCount);
        if (result == targetPosition) {
            return [self targetPositionRandom:YES];
        }
    } else {
        result = (targetPosition + 1) % TENPositionCount;
    }
    
    return result;
}

- (CGRect)frameForPosition:(TENSquarePosition)position inSuperviewFrame:(CGRect)superviewFrame {
    CGRect frame;
    frame.size = CGSizeMake(sizeSquare, sizeSquare);
    
    CGFloat maxX = CGRectGetWidth(superviewFrame) - CGRectGetWidth(frame);
    CGFloat maxY = CGRectGetHeight(superviewFrame) - CGRectGetHeight(frame);
    
    CGPoint origin = CGPointZero;
    switch (self.targetPosition) {
        case TENPositionRightUp:
            origin.x = maxX;
            break;
        case TENPositionRightDown:
            origin = CGPointMake(maxX, maxY);
            break;
        case TENPositionLeftDown:
            origin.y = maxY;
            break;
        default:
            break;
    }
    
    frame.origin = origin;
    
    return frame;
}

@end
