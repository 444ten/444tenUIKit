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
+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundleOrNil;

- (id)instantiateWithClass:(Class)cls;
- (id)instantiateWithClass:(Class)cls owner:(id)ownerOrNil options:(NSDictionary *)optionsOrNil;

@end
