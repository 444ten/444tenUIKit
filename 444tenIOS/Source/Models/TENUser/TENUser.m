//
//  TENUser.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUser.h"

@implementation TENUser

@dynamic userImage;

#pragma mark -
#pragma mark Accessors

- (UIImage *)userImage {
    return [UIImage imageNamed:@"cat.jpg"];
}


@end
