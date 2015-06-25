//
//  TENUsersView.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUsersView.h"

#import "TENChangedPath.h"

static NSString * const kEdit = @"Edit";
static NSString * const kDone = @"Done";

@implementation TENUsersView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.editing = NO;
}

#pragma mark -
#pragma mark - Accessors

- (void)setEditing:(BOOL)editing {
    if (_editing != editing) {
        _editing = editing;
        
        [self.tableView setEditing:editing animated:YES];
        [self.editButton setTitle:editing ? kDone : kEdit
                         forState:UIControlStateNormal];
    }
}

@end
