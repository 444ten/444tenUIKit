//
//  UINib+TENExtensions.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/20/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (TENExtensions)

+ (UINib *)nibWithClass:(Class)cls;
+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)cls;
+ (id)objectWithClass:(Class)cls owner:(id)owner;

+ (id)objectWithClass:(Class)cls
               bundle:(NSBundle *)bundle
                owner:(id)owner
              options:(NSDictionary *)options;

- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options;

@end
