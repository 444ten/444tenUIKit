//
//  TENUsers.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUsers.h"

#import "TENUser.h"

@interface TENUsers ()
@property   (nonatomic, strong)   NSMutableArray *users;

- (void)fillUsers:(NSMutableArray *)users;

@end

@implementation TENUsers

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype)init {
    self = [super init];
    if (self) {
        self.users = [NSMutableArray new];
        
        [self fillUsers:self.users];
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (TENUser *)objectAtIndexedSubscript:(NSUInteger)index {
    return self.users[index];
}

#pragma mark -
#pragma mark Private

- (void)fillUsers:(NSMutableArray *)users {

    TENUser *user0 = [TENUser new];
    user0.name = @"user0";
    [self.users addObject:user0];
    
    TENUser *user1 = [TENUser new];
    user1.name = @"user1";
    [self.users addObject:user1];

    TENUser *user2 = [TENUser new];
    user2.name = @"user2";
    [self.users addObject:user2];
}


#pragma mark -
#pragma mark NSFastEnumeration protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len {
    return [self.users countByEnumeratingWithState:state objects:buffer count:len];
}

@end
