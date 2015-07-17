//
//  TSTImageModel.h
//  444tenIOS
//
//  Created by Andrey Ten on 7/1/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TENObservableObject.h"

typedef NS_ENUM(NSUInteger, TENImageModelState) {
    TENImageModelUnloaded,
    TENImageModelLoading,
    TENImageModelLoaded,
    TENImageModelFailingLoading
};

@interface TSTImageModel : TENObservableObject
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

- (void)load;
- (void)dump;

@end
