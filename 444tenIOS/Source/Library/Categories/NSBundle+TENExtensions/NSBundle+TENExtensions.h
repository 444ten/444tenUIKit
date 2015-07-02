//
//  NSBundle+TENExtensions.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/1/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (TENExtensions)

- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls owner:(id)owner;
- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options;

@end
