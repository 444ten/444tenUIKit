//
//  TENUser.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUser.h"

static NSString * const kTENFailImageName   = @"cat.jpg";
static NSString * const kCoderName          = @"kCoderName";

static NSUInteger userNumber = 0;

@interface TENUser ()
@property (nonatomic, strong) UIImage   *userImage;

@end

@implementation TENUser

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {

    self = [super init];
    if (self) {
        self.name = [NSString stringWithFormat:@"User_%lu", userNumber];
        
        userNumber += 1;
    }
    
    return self;
}

#pragma mark -
#pragma mark Overloading

- (void)performLoadingInBackground {
    usleep(1000*1000 + 1000 * arc4random_uniform(1000));
    
    UIImage *image = [UIImage imageNamed:self.name];
    self.userImage = image ? image : [UIImage imageNamed:kTENFailImageName];
    
    self.state = TENModelLoaded;
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
