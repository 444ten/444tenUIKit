//
//  TENTableViewCell.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/19/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENTableViewCell.h"

@implementation TENTableViewCell

#pragma mark - 
#pragma mark Accessors

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
