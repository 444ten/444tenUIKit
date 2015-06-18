//
//  TENSquareView.m
//  TENSquare
//
//  Created by 444ten on 6/14/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENSquareView.h"

static const NSTimeInterval TENAnimateDuration  = 1.0;
static const NSTimeInterval TENAnimateDelay     = 0.0;

@interface TENSquareView ()

- (CGRect)frameForPosition:(TENSquarePosition)position;
- (void)cyclicMoveToNextPositionCompletion:(void (^)(BOOL finished))completion;

@end

@implementation TENSquareView

#pragma mark -
#pragma mark Accessors

- (void)setMoving:(BOOL)moving completion:(void (^)(BOOL finished))completion {
    if (_moving != moving) {
        _moving = moving;
        
        if (moving) {
            [self cyclicMoveToNextPositionCompletion:completion];
        }
    }
}

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
    TENSquareModel *square = self.square;
    square.targetPosition = targetPosition;
    
    [UIView animateWithDuration:animated ? TENAnimateDuration : 0
                          delay:TENAnimateDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.frame = [self frameForPosition:targetPosition];
                     }
                     completion:^(BOOL finished) {
                         if (completion) {
                             completion(finished);
                         }
                     }];
}

#pragma mark -
#pragma mark Private

- (void)moveToNextPositionAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    [self setTargetPosition:[self.square nextTargetPosition]
                   animated:animated
          completionHandler:completion];
}

- (void)moveToRandomPositionAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    [self setTargetPosition:[self.square randomTargetPosition]
                   animated:animated
          completionHandler:completion];
}

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

- (void)cyclicMoveToNextPositionCompletion:(void (^)(BOOL finished))completion {
    [self moveToNextPositionAnimated:YES completion:^(BOOL finished) {
        if (finished && self.isMoving) {
            [self cyclicMoveToNextPositionCompletion:completion];
        }
        
        completion(finished);
    }];
}

@end
