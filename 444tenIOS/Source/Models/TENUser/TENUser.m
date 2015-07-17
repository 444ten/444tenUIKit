//
//  TENUser.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUser.h"

#import "TENImageModel.h"

static NSString * const kCoderName  = @"kCoderName";

@implementation TENUser

@dynamic imageModel;

#pragma mark -
#pragma mark Accessors

- (TENImageModel *)imageModel {
    return [TENImageModel imageWithURL:self.imageUrl];
}

#pragma mark -
#pragma mark NSCoding protocol

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:kCoderName];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kCoderName];
}

@end
