//
//  TENUsersView.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TENUsersView : UIView
@property (nonatomic, strong)   IBOutlet UIButton       *addButton;
@property (nonatomic, strong)   IBOutlet UIButton       *editButton;
@property (nonatomic, strong)   IBOutlet UIButton       *restoreButton;
@property (nonatomic, strong)   IBOutlet UITableView    *tableView;

@property (nonatomic, assign, getter=isEditing) BOOL    editing;
@property (nonatomic, assign, getter=isLocked)  BOOL    locked;

@end
