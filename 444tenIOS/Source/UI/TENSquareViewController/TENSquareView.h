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
    TENositionCount
};

@interface TENSquareView : UIView
@property (nonatomic, unsafe_unretained)    TENSquarePosition   squarePosition;

@end
