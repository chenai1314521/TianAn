//
//  MyNavigationController.m
//  TianAnRenShou
//
//  Created by han on 15/4/11.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

/**
 *第一次调用类的时候会调用一次该方法
 */
+ (void)initialize
{
    //设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
    
    
    //设置UINavigationBar的主题
    [self setupNavigationBarTheme];
}

/**
 *设置UINavigationBar的主题
 */
+ (void)setupNavigationBarTheme
{
    //通过设置appearance对象，能够修改整个项目中所有UINavigationBar的样式
    UINavigationBar *appearance = [UINavigationBar appearance];
    //设置状态栏为白色
    [appearance setBarStyle:UIBarStyleBlack];

    [appearance setBackgroundImage:[UIImage resizedImage:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    
    
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    
    //设置字体颜色
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //设置字体
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [appearance setTitleTextAttributes:textAttrs];
    
    
}
/**
 *设置UIBarButtonItem的主题
 */
+ (void)setupBarButtonItemTheme
{
    //通过设置appearance对象，能够修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    //设置文字的属性
    //1.设置普通状态下文字的属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //设置字体
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];

    //设置颜色为橙色
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    
    
    //2.设置高亮状态下文字的属性
    //使用1中的textAttrs进行通用设置
    NSMutableDictionary *hightextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    //设置颜色为红色
    hightextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [appearance setTitleTextAttributes:hightextAttrs forState:UIControlStateHighlighted];
    
    
    
    
    //3.设置不可用状态下文字的属性
    //使用1中的textAttrs进行通用设置
    NSMutableDictionary *disabletextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    //设置颜色为灰色
    disabletextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disabletextAttrs forState:UIControlStateDisabled];
    
    
    
    //设置背景
    //技巧提示：为了让某个按钮的背景消失，可以设置一张完全透明的背景图片
    [appearance setBackButtonBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    //如果现在push的不是栈顶控制器，那么久隐藏tabbar工具条
    if (self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        
#warning 修改图片
        //拦截push操作，设置导航栏的左上角和右上角按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem  itemWithImageName:@"navigationbar_back" highImageName:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        //viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_more" highImageName:@"navigationbar_more_highlighted" target:self action:@selector(more)];
        
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}
@end
