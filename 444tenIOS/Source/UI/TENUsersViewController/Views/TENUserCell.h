//
//  TENUserCell.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/19/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import "TENTableViewCell.h"

@class TENUser;

@interface TENUserCell : TENTableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *nameLabel;
@property (nonatomic, strong)   IBOutlet UIImageView    *userImageView;

@property (nonatomic, strong)   TENUser *user;

- (void)fillWithModel:(TENUser *)user;

@end
