//
//  MainController.m
//  TianAnRenShou
//
//  Created by han on 15/4/11.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "MineController.h"
#import "MyOrderViewController.h"
#import "MyAttentionViewController.h"
#import "MyBidScheduleViewController.h"
#import "MyInsuranceViewController.h"
#import "AboutTianAnViewController.h"
#import "MainTitleView.h"
#import "LoginSeccessView.h"
#import "LoginFailureView.h"
#import "SettingDetailTableViewController.h"
#import "LoginViewController.h"
#import "MainLeftBarButton.h"


@interface MineController ()
{
    BOOL testBol;
}
@property (strong, nonatomic) NSMutableArray *groupArr;

@end

@implementation MineController

/**
 *  懒加载
 */
- (NSMutableArray *)groupArr
{
    if (!_groupArr)
    {
        _groupArr = [NSMutableArray array];
    }
    return _groupArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置E-Maill按钮
    [self setupLeftBtn];
#warning 测试按钮，删除
    testBol = NO;
    
    //添加table的头试图
    MainTitleView *titleView = [MainTitleView getMainTitleView];
    UIView *subView = [self showTitleView];
    [titleView addSubview:subView];
    self.tableView.tableHeaderView = titleView;
    
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    [footerView setBackgroundColor:[UIColor clearColor]];
    self.tableView.tableFooterView = footerView;
    
    
    
    //添加组数据
    [self setupGroup01];
    [self setupGroup02];
    [self setupGroup03];
    
    
    //赋值
    self.datas = self.groupArr;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //显示tabbar
    //[self showTabBar];
    
    
#warning  删除 bol
    testBol = !testBol;
    self.tableView.tableHeaderView = nil;
    //添加table的头试图
    MainTitleView *titleView = [MainTitleView getMainTitleView];
    UIView *subView = [self showTitleView];
    [titleView addSubview:subView];
    self.tableView.tableHeaderView = titleView;
}
- (void)setupLeftBtn
{
    MainLeftBarButton *leftBarButton = [MainLeftBarButton getMainLeftBarButton];
    
    //点击E-Maill按钮出发的事件
    leftBarButton.emaillBtnTouchUpInset = ^{
        
    };
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
}
- (UIView *)showTitleView
{
    UIView *view;
    
#warning 判断是否登陆成功
    if (testBol)//登陆成功
    {
        //登陆成功后显示试图
        LoginSeccessView *seccess = [LoginSeccessView getLoginSeccessView];
        //点击操作
        seccess.touchLoginFailureViewBlock = ^{
            [self pushToSettingDetailTableViewController];
        };
        view = seccess;
        
    }
    else
    {
        //尚未登陆显示试图
        LoginFailureView *failureView = [LoginFailureView getLoginFailureView];
        //点击操作
        failureView.loginFailureViewBlock = ^{
            [self presentToLoginViewController];
        };
        view = failureView;
        
    }
    return view;
}



//第一组数据
- (void)setupGroup01
{
    
    SettingArrowItem *arrowItemMyOrder = [[SettingArrowItem alloc] initWithIconName:@"myOrder" titleName:@"我的订单" destClass:[MyOrderViewController class]];
    
    SettingArrowItem *arrowItemMyAttention = [[SettingArrowItem alloc] initWithIconName:@"myAttention" titleName:@"我的关注" destClass:[MyAttentionViewController class]];
    
    
    //将数据模型添加到组模型里
    SettingGroup *group01 = [[SettingGroup alloc] init];
    group01.allItems = @[arrowItemMyOrder, arrowItemMyAttention];
    [self.groupArr addObject:group01];
}
//第二组
- (void)setupGroup02
{
    SettingArrowItem *arrowItemMyBidSchedule = [[SettingArrowItem alloc] initWithIconName:@"myBidSchedul" titleName:@"我的申办进度" destClass:[MyBidScheduleViewController class]];
    SettingArrowItem *arrowItemMyInsurance = [[SettingArrowItem alloc] initWithIconName:@"myInsurance" titleName:@"我的申办进度" destClass:[MyInsuranceViewController class]];
    
    
    SettingGroup *group02 = [[SettingGroup alloc] init];
    group02.allItems = @[arrowItemMyBidSchedule, arrowItemMyInsurance];
    
    [self.groupArr addObject:group02];
}
//第三组
- (void)setupGroup03
{
    SettingLabelItem *labelItemMyVersons = [[SettingLabelItem alloc] initWithTitleName:@"版本信息" subTitle:@"1.1.2"];
    labelItemMyVersons.iconName = @"myVersions";
    
    SettingArrowItem *arrowItemAboutTianAn = [[SettingArrowItem alloc] initWithIconName:@"aboutTianAn" titleName:@"关于天安" destClass:[AboutTianAnViewController class]];
    
    
    SettingGroup *group03 = [[SettingGroup alloc] init];
    group03.allItems = @[labelItemMyVersons, arrowItemAboutTianAn];
    
    [self.groupArr addObject:group03];
}





// 推到设置页面
- (void)pushToSettingDetailTableViewController
{
    SettingDetailTableViewController *detailVC = [[SettingDetailTableViewController alloc] init];
    //self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

//推到登陆页面
- (void)presentToLoginViewController
{
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    loginVC.title = @"天安人寿";
    //隐藏tabbar
    //self.hidesBottomBarWhenPushed = YES;
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:loginVC];
    
    
    
    //设置statusbar为白色
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
    [navc.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbg"] forBarMetrics:UIBarMetricsDefault];
    
    [self presentViewController:navc animated:YES completion:^{
        
    }];
}


@end
