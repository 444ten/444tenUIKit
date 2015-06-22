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
#import "TENUserCell.h"
#import "TENUsers.h"
#import "TENUsersView.h"

typedef void (^TENRowAction)(UITableViewRowAction *action, NSIndexPath *indexPath);

TENViewControllerBaseViewProperty(TENUsersViewController, usersView, TENUsersView);

@interface TENUsersViewController ()

- (TENRowAction)rowAction;

@end

@implementation TENUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.users addObserver:self];
    
    [self.usersView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onAddButton:(id)sender {
    [self.users addObject];
}

- (IBAction)onEditButton:(UIButton *)sender {
    UITableView *tableView = self.usersView.tableView;
    BOOL isEditing = tableView.isEditing;
    
    [tableView setEditing:!isEditing animated:YES];
    
    [sender setTitle:isEditing ? @"Edit" : @"Done"
            forState:UIControlStateNormal];
}

#pragma mark - 
#pragma mark UITableViewDelegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

//- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewRowAction *startRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
//                                                                              title:@"start" handler:[self rowAction]];
//    UITableViewRowAction *finishRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
//                                                                              title:@"finish" handler:[self rowAction]];
//    return @[finishRowAction, startRowAction];
//}

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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                                            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.users removeObjectAtIndex:indexPath.row];
    }
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
                                                  toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveObjectAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark TENUsersObserver

- (void)usersDidBecomeChanged:(TENUsers *)users {
    [self.usersView.tableView reloadData];
    
    users.state = TENUsersChangesShown;
}

#pragma mark -
#pragma mark Private

- (TENRowAction)rowAction {
    return ^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"row %lu -> %@", indexPath.row, action.title);
    };
}

@end
