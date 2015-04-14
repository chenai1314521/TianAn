//
//  MyTabBarViewController.m
//  TianAnRenShou
//
//  Created by han on 15/4/11.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "HomeViewController.h"
#import "DescoverController.h"
#import "ServiceController.h"
#import "MineController.h"
#import "MyNavigationController.h"
#import "MyTabBar.h"
#import "TabbarItemModel.h"

@interface MyTabBarViewController () <MyTabBarDelegate>
//存放itemModel数组
@property (strong, nonatomic) NSArray *datas;
@end

@implementation MyTabBarViewController

- (NSArray *)datas
{
    if (!_datas)
    {
#warning 获取tabbaritem数据
//        NSArray *jsonDatas = @[@{},@{},@{},@{},];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    


    //添加四个子控制器
    [self addAllChildVcs];
    
    // 调整tabbar
    [self addCustomTabBar];
}

- (void)addAllChildVcs
{
    
    
    HomeViewController *home = [[HomeViewController alloc] init];
    [self addOneChildVc:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    
    ServiceController *service = [[ServiceController alloc] init];
    [self addOneChildVc:service title:@"微客服" imageName:@"tabbar_searvice" selectedImageName:@"tabbar_searvice_selected"];
    
    
    
    DescoverController *descover = [[DescoverController alloc] init];
    [self addOneChildVc:descover title:@"发现" imageName:@"tabbar_descover" selectedImageName:@"tabbar_descover_selected"];
    
    MineController *profile = [[MineController alloc] init];
    [self addOneChildVc:profile title:@"我的" imageName:@"tabbar_main" selectedImageName:@"tabbar_main_selected"];

    
    
}

- (void)addCustomTabBar
{
    MyTabBar *customTabBar = [[MyTabBar alloc] init];
    //设置代理
    customTabBar.myDelegate = self;
    // 更换系统自带的tabbar
    [self setValue:customTabBar forKeyPath:@"tabBar"];
}

#pragma mark-MyTabBarDelegate
- (void)tabBarDidClickedPlusButton:(MyTabBar *)tabBar
{
    
#warning 说话的操作
}


/**
 *  添加一个子控制器
 *
 *  @param childVC           子控制对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中时的图标
 */
- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    childVc.title = title;
    
    //设置图标

    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    
    //设置选中时的图标

    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    //设置tabBarItem普通状态下文字的颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = setColor(158, 158, 158, 1);
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:12];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置tabBarItem普通状态下文字的颜色
    NSMutableDictionary *selectedtextAttrs = [NSMutableDictionary dictionary];
    selectedtextAttrs[NSForegroundColorAttributeName] = setColor(6, 193, 174, 1);
    [childVc.tabBarItem setTitleTextAttributes:selectedtextAttrs forState:UIControlStateSelected];
    
    
    
    if (iOS7)
    {
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    childVc.tabBarItem.selectedImage = selectedImage;
    
    //添加为tabbar控制器的子控制器
    MyNavigationController *navc = [[MyNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navc];
    
}

@end
