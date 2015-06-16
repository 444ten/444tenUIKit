//
//  TENSquareView.m
//  TENSquare
//
//  Created by 444ten on 6/14/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENSquareView.h"

static const NSTimeInterval TENAnimateDuration  = 2.0;
static const NSTimeInterval TENAnimateDelay     = 0.0;


@interface TENSquareView ()

- (CGRect)frameForPosition:(TENSquarePosition)position;

@end

@implementation TENSquareView

#pragma mark -
#pragma mark Accessors

- (void)setTargetPosition:(TENSquarePosition)targetPosition {
    [self setTargetPosition:targetPosition animated:NO];
}

- (void)setTargetPosition:(TENSquarePosition)targetPosition animated:(BOOL)animated {
    [self setTargetPosition:targetPosition animated:animated completionHandler:nil];
}

- (void)setTargetPosition:(TENSquarePosition)targetPosition
           animated:(BOOL)animated
  completionHandler:(void (^)(BOOL finished))completion
{
    _targetPosition = targetPosition;

    NSTimeInterval duration = animated ? TENAnimateDuration : 0;
    
    [UIView animateWithDuration:duration
                          delay:TENAnimateDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.frame = [self frameForPosition:targetPosition];
                     }
                     completion:^(BOOL finished) {
                         _position = targetPosition;
                         
                         if (completion) {
                             completion(finished);
                         }
                     }];
}

#pragma mark -
#pragma mark Private

- (CGRect)frameForPosition:(TENSquarePosition)targetPosition {
    CGRect frame = self.frame;
    CGRect superviewFrame = self.superview.frame;
    
    CGFloat maxX = CGRectGetWidth(superviewFrame) - CGRectGetWidth(frame);
    CGFloat maxY = CGRectGetHeight(superviewFrame) - CGRectGetHeight(frame);
    
    CGPoint origin = CGPointZero;
    switch (targetPosition) {
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
