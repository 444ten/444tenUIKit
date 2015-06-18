//
//  TENMacro.h
//  444tenIOS
//
//  Created by Andrey Ten on 6/18/15.
//  Copyright (c) 2015 Andrey Ten. All rights reserved.
//

#define TENDefineBaseViewProperty(propertyName, viewClass)\
    @property (nonatomic, readonly) viewClass *propertyName;

#define TENBaseViewGetterSynthesize(selector, viewClass)\
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define TENViewControllerBaseViewProperty(baseViewController, propertyName, baseViewClass) \
    @interface baseViewController (__TENPrivateBaseView) \
    TENDefineBaseViewProperty(propertyName, baseViewClass) \
    \
    @end \
    \
    @implementation TENSquareViewController (__TENPrivateBaseView) \
    \
    @dynamic propertyName; \
    \
    TENBaseViewGetterSynthesize(propertyName, baseViewClass); \
    \
    @end
