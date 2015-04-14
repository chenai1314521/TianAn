//
//  UIBarButtonItem+HZK.h
//  TianAnRenShou
//
//  Created by han on 15/4/11.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HZK)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;
@end
