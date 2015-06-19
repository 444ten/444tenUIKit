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
    static NSString * const kTENCellName = @"kTENCellName";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTENCellName];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:kTENCellName];
    }
    cell.textLabel.text = self.users[indexPath.row].name;
    
    return cell;
}

@end
