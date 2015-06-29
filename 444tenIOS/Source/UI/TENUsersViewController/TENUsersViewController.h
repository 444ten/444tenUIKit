//
//  TENUsersViewController.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENUsers.h"

@interface TENUsersViewController : UIViewController <  UITableViewDelegate,
                                                        UITableViewDataSource,
                                                        TENUsersObserver>
@property (nonatomic, strong)   TENUsers    *users;

- (IBAction)onAddButton:(id)sender;
- (IBAction)onEditButton:(id)sender;
- (IBAction)onRestoreButton:(id)sender;

@end
