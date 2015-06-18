//
//  TENUsers.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TENUser;

@interface TENUsers : NSObject <NSFastEnumeration>

- (TENUser *)objectAtIndexedSubscript:(NSUInteger)index;

@end
