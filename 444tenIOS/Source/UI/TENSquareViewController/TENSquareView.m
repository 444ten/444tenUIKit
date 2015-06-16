//
//  TENSquareView.m
//  TENSquare
//
//  Created by 444ten on 6/14/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENSquareView.h"

@interface TENSquareView ()

- (CGRect)frameForPosition:(TENSquarePosition)position;

@end

@implementation TENSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(TENSquarePosition)squarePosition {
    if (_squarePosition != squarePosition) {
        self.frame = [self frameForPosition:squarePosition];
        
        _squarePosition = squarePosition;
    }
}

#pragma mark -
#pragma mark Private

- (CGRect)frameForPosition:(TENSquarePosition)position {
    CGRect frame = self.frame;
    CGRect superviewFrame = self.superview.frame;
    
    CGFloat maxX = CGRectGetWidth(superviewFrame) - CGRectGetWidth(frame);
    CGFloat maxY = CGRectGetHeight(superviewFrame) - CGRectGetHeight(frame);
    
    CGPoint origin = CGPointZero;
    switch (position) {
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
