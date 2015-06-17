//
//  TENSquareView.m
//  TENSquare
//
//  Created by 444ten on 6/14/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENSquareView.h"

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
    TENSquareModel *square = self.square;
    square.targetPosition = targetPosition;

    NSTimeInterval duration = animated ? TENAnimateDuration : 0;
    
    [UIView animateWithDuration:duration
                          delay:TENAnimateDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.frame = [square frameForPosition:targetPosition inSuperviewFrame:self.superview.frame];
                     }
                     completion:^(BOOL finished) {
                         square.position = targetPosition;
                         
                         if (completion) {
                             completion(finished);
                         }
                     }];
}

@end
