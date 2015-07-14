//
//  TENUser.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUser.h"

#import "TENMacro.h"

static NSString * const kCoderName          = @"kCoderName";
static NSString * const kTENFailImageName   = @"cat.jpg";
static NSString * const kTENURL             = @"http://rsload.net/images4/vin/2014/0707/pri";

static NSUInteger userNumber = 0;

@interface TENUser ()

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
    TENUSleep(1000*1000 + 1000 * arc4random_uniform(1000));
    
    NSString *string = [NSString stringWithFormat:@"%@%lu.jpg", kTENURL, userNumber - 1];
    
    TENImage *userImage = [TENImage imageWithURL:[NSURL URLWithString:string]];
   
    [userImage addObserver:self];
    
    self.userImage = userImage;
}

#pragma mark -
#pragma mark TENModelObserver

- (void)modelDidLoad:(id)model {
    self.state = TENModelLoaded;
}

- (void)modelDidFailLoad:(id)model {
    self.userImage.image = [UIImage imageNamed:kTENFailImageName];
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
