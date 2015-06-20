//
//  UITableView+TENExtensions.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/20/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (TENExtensions)

- (id)cellWithClass:(Class)cls;
- (id)cellWithClass:(Class)cls
             bundle:(NSBundle *)bundle
              owner:(id)owner
            options:(NSDictionary *)options;

@end
