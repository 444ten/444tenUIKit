//
//  TENUsersView.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUsersView.h"

#import "TENChangedPath.h"
#import "TENLoadingView.h"

static NSString * const kEdit = @"Edit";
static NSString * const kDone = @"Done";

@interface TENUsersView ()
@property (nonatomic, strong)   TENLoadingView  *loadingView;

@end

@implementation TENUsersView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];

    self.loadingView = [TENLoadingView viewInSuperview:self];
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

#pragma mark -
#pragma mark - Public

- (void)lock {
    self.loadingView.locking = YES;
}

- (void)unlock {
    self.loadingView.locking = NO;
}

@end
