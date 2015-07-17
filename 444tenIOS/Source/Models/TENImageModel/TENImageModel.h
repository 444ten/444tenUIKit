//
//  TENImageModel.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/13/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENModel.h"

@interface TENImageModel : TENModel <NSURLSessionDataDelegate>
@property (nonatomic, strong) UIImage *image;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

@end
