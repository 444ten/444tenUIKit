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

- (TENSquarePosition)nextTargetPosition {
    return (self.targetPosition + 1) % TENPositionCount;
}

- (TENSquarePosition)randomTargetPosition {
    TENSquarePosition result = 0;
    TENSquarePosition targetPosition = self.targetPosition;
    
    do {
        result = arc4random_uniform(TENPositionCount);
    } while (result == targetPosition);
    
    return result;
}

@end
