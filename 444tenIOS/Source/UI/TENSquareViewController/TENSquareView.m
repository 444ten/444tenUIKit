//
//  TENSquareView.m
//  TENSquare
//
//  Created by 444ten on 6/14/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENSquareView.h"

@interface TENSquareView ()

- (CGPoint)originWithPosition:(TENSquarePosition)position;

@end

@implementation TENSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(TENSquarePosition)squarePosition {
    if (_squarePosition != squarePosition) {
        CGRect frame = self.frame;
        frame.origin = [self originWithPosition:squarePosition];
        self.frame = frame;
        
        _squarePosition = squarePosition;
    }
}

#pragma mark -
#pragma mark Private

- (CGPoint)originWithPosition:(TENSquarePosition)position {
    CGPoint origin;
    switch (position) {
        case TENPositionLeftUp: {
            origin = CGPointMake(0.0, 0.0);
            break;
        }
        case TENPositionLeftDown: {
            origin = CGPointMake(0.0, 100.0);
            break;
        }
        case TENPositionRightUp: {
            origin = CGPointMake(100.0, 0.0);
            break;
        }
        case TENPositionRightDown: {
            origin = CGPointMake(100.0, 100.0);
            break;
        }
        default:
            break;
    }
    
    return origin;
}

@end
