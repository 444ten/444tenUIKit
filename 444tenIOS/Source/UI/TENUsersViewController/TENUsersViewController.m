
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
#import "TENImageModel.h"
#import "TENMacro.h"
#import "TENThread.h"
#import "TENUser.h"
#import "TENUserCell.h"
#import "TENUsers.h"
#import "TENUsersView.h"

static NSString * const kTENURL = @"http://rsload.net/images4/vin/2014/0707/";

static NSUInteger userNumber = 0;

TENViewControllerBaseViewProperty(TENUsersViewController, usersView, TENUsersView);

@interface TENUsersViewController ()

- (TENUser *)user;

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
        
        [_users load];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.users load];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    [self.users addObject:[self user]];
}

- (IBAction)onEditButton:(UIButton *)sender {
    TENUsersView *view = self.usersView;
    view.editing = !view.editing;
}

- (IBAction)onRestoreButton:(id)sender {
    [self.users load];
}

#pragma mark -
#pragma mark Private

- (TENUser *)user {
    TENUser *result = [TENUser new];

//    NSString *name = [NSString stringWithFormat:@"pri%lu.jpg", userNumber];
    userNumber += 1;
    
    NSUInteger step = userNumber < 8 ? 0 : 3;
    NSUInteger randomNumber = arc4random() % 3 + step;
    
    NSString *name = [NSString stringWithFormat:@"pri%lu.jpg", randomNumber];
    
    result.name = name;
    result.imageUrl = [[NSURL URLWithString:kTENURL] URLByAppendingPathComponent:name];

    return result;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.users[indexPath.row] = [self user];
}

- (void)    tableView:(UITableView *)tableView
 didEndDisplayingCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%@", indexPath);
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

- (void)modelWillLoad:(id)model {
    self.usersView.locked = YES;
}

- (void)modelDidLoad:(id)model {
    TENWeakify(self);
    
    TENPerformOnMainThreadWithBlock(^{
        TENStrongifyAndReturnIfNil(self);
        
        TENUsersView *usersView = self.usersView;
        usersView.locked = NO;
        [usersView.tableView reloadData];
    });
}

- (void)model:(id)model didChangeWithUsersInfo:(TENChangedPath *)path {
    [self.usersView.tableView updateTableViewWithChangedPath:path];
}

@end
