//
//  TENUsersViewController.m
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENUsersViewController.h"

#import "TENMacro.h"
#import "TENUser.h"
#import "TENUserCell.h"
#import "TENUsers.h"
#import "TENUsersView.h"

TENViewControllerBaseViewProperty(TENUsersViewController, usersView, TENUsersView);

@interface TENUsersViewController ()

@end

@implementation TENUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.usersView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 
#pragma mark UITableViewDelegate


#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellClassName = NSStringFromClass([TENUserCell class]);
    
    TENUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClassName];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:cellClassName bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    cell.user = self.users[indexPath.row];
    
    return cell;
}

@end
