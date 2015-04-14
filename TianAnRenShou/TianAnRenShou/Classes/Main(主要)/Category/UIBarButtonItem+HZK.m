//
//  UIBarButtonItem+HZK.m
//  TianAnRenShou
//
//  Created by han on 15/4/11.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "UIBarButtonItem+HZK.h"

@implementation UIBarButtonItem (HZK)
//在这里，我们需要设置两种状态下的图片，显然该方法无法满足我们的需求。那么我们就位UIBarButtonItem增加一个分类，扩充一个方法，让其能够设置两种状态下的两张图片。

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
    //自定义UIView
    UIButton *btn = [[UIButton alloc] init];
    
    //设置按钮的背景图片（默认/高亮）
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    
    
    //设置按钮的尺寸和图片一样大，使用了UIImage的分类
    btn.bounds = CGRectMake(0, 0, btn.currentBackgroundImage.size.width, btn.currentBackgroundImage.size.height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
