//
//  TENUsersViewController.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUsersViewController.h"

#import "UINib+TENExtensions.h"
#import "UITableView+TENExtensions.h"

#import "TENChangedPath.h"
#import "TENLoadingView.h"
#import "TENMacro.h"
#import "TENThread.h"
#import "TENUser.h"
#import "TENUserCell.h"
#import "TENUsers.h"
#import "TENUsersView.h"

TENViewControllerBaseViewProperty(TENUsersViewController, usersView, TENUsersView);

@interface TENUsersViewController ()
@property (nonatomic, strong)   TENLoadingView *loadingView;

@end

@implementation TENUsersViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.users = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(TENUsers *)users {
    if (_users != users) {
        [_users removeObserver:self];
        
        _users = users;
        [_users addObserver:self];
        
        [self.loadingView lock];
        [_users load];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TENUsersView *usersView = self.usersView;
    
    if (TENUsersLoaded == self.users.state) {
        [usersView.tableView reloadData];
    } else {
        TENLoadingView *loadingView = self.loadingView;
        if (!loadingView) {
            loadingView = [TENLoadingView viewInSuperView:usersView];
            self.loadingView = loadingView;
        }
        
        [loadingView lock];
    }
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {    
    [self.users addObject:[TENUser new]];
}

- (IBAction)onEditButton:(UIButton *)sender {
    TENUsersView *view = self.usersView;
    view.editing = !view.editing;
}

- (IBAction)onRestoreButton:(id)sender {
    [self.loadingView lock];
    [self.users load];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.users[indexPath.row] = [TENUser new];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TENUserCell *cell = [tableView cellWithClass:[TENUserCell class]];
    cell.user = self.users[indexPath.row];
    
    return cell;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.users removeObjectAtIndex:indexPath.row];
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveObjectAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark TENUsersObserver

- (void)users:(TENUsers *)users didLoadWithUsersInfo:(id)userInfo {
    TENPerformOnMainThreadWithBlock(^{
        [self.loadingView unlock];
        [self.usersView.tableView reloadData];
    });
}

- (void)users:(TENUsers *)users didChangeWithUsersInfo:(TENChangedPath *)path {
    [self.usersView.tableView updateTableViewWithChangedPath:path];
}

@end
