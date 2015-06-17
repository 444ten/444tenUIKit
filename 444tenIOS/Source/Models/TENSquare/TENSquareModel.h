//
//  TENSquareModel.h
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

@interface TENSquareModel : NSObject
@property (nonatomic, assign)   TENSquarePosition   position;
@property (nonatomic, assign)   TENSquarePosition   targetPosition;

- (TENSquarePosition)nextTargetPosition;
- (TENSquarePosition)randomTargetPosition;

@end
