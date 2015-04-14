//
//  MyTabBar.h
//  TianAnRenShou
//
//  Created by han on 15/4/11.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 三、加号按钮的点击事件
 
 使用代理方法，当点击加号按钮的时候，通知UITabBarController以模态的方式弹出控制器。
 
 实现代码：
 */
@class MyTabBar;
@protocol MyTabBarDelegate <NSObject>

- (void)tabBarDidClickedPlusButton:(MyTabBar *)tabBar;

@end



@interface MyTabBar : UITabBar
@property (weak, nonatomic) id <MyTabBarDelegate> myDelegate;
@end