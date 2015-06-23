//
//  TENUsersViewController.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUsersViewController.h"

#import "UITableView+TENExtensions.h"

#import "TENMacro.h"
#import "TENModifiedIndexPaths.h"
#import "TENUserCell.h"
#import "TENUser.h"
#import "TENUsers.h"
#import "TENUsersView.h"

TENViewControllerBaseViewProperty(TENUsersViewController, usersView, TENUsersView);

@interface TENUsersViewController ()

@end

@implementation TENUsersViewController

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(TENUsers *)users {
    if (_users != users) {
        
        [_users removeObserver:self];
        
        _users = users;
        
        [users addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.usersView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {    
    TENUsers * users = self.users;
    [users addObject:[TENUser testUser]];
    [users addObject:[TENUser testUser]];
}

- (IBAction)onEditButton:(UIButton *)sender {
    TENUsersView *view = self.usersView;
    view.editing = !view.editing;
}

#pragma mark - 
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.users[indexPath.row] = [TENUser testUser];
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
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

- (void)usersChanged:(TENUsers *)users {
    TENModifiedIndexPaths *indexPaths = users.modifiedIndexPaths;
    UITableView *tableView = self.usersView.tableView;
    
    [tableView beginUpdates];
    
    [tableView insertRowsAtIndexPaths:indexPaths.insertingPaths withRowAnimation:UITableViewRowAnimationLeft];
    [tableView deleteRowsAtIndexPaths:indexPaths.deletingPaths withRowAnimation:UITableViewRowAnimationLeft];
    [tableView reloadRowsAtIndexPaths:indexPaths.reloadingPaths withRowAnimation:UITableViewRowAnimationRight];
    
    [tableView endUpdates];
}

#pragma mark -
#pragma mark Private

@end
