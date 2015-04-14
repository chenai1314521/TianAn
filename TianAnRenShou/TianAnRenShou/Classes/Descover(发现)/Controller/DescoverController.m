//
//  DescoverController.m
//  TianAnRenShou
//
//  Created by han on 15/4/11.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "DescoverController.h"
#import "CircleTableView.h"
#import "InsuranceViewController.h"
#import "NearViewController.h"
#import "ShakeViewController.h"
#import "SweepViewController.h"
#import "NearWebViewController.h"
@interface DescoverController ()
@property (strong, nonatomic) NSMutableArray *groupArr;

@end

@implementation DescoverController

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加组数据
    [self setupGroup01];
    [self setupGroup02];
    [self setupGroup03];
    [self setupGroup04];
    
    //赋值
    self.datas = self.groupArr;
    
}

//第一组数据
- (void)setupGroup01
{
    //需要跳转的页面
    SettingArrowItem *arrowItemMyCircle = [[SettingArrowItem alloc] initWithIconName:@"pengyouquan" titleName:@"我的圈子" destClass:[CircleTableView class]];
    //添加副试图
    arrowItemMyCircle.subtitleImageName = @"tuxiang";
    //新消息
    arrowItemMyCircle.newAlert = YES;
    //将数据模型添加到组模型里
    SettingGroup *group01 = [[SettingGroup alloc] init];
    group01.allItems = @[arrowItemMyCircle];
    
    [self.groupArr addObject:group01];
}
//第二组
- (void)setupGroup02
{
    SettingArrowItem *arrowItemSweep = [[SettingArrowItem alloc] initWithIconName:@"saoyisao" titleName:@"扫一扫" destClass:[SweepViewController class]];
    SettingArrowItem *arrowItemShake = [[SettingArrowItem alloc] initWithIconName:@"yaoyiyao" titleName:@"摇一摇" destClass:[ShakeViewController class]];
    SettingGroup *group02 = [[SettingGroup alloc] init];
    group02.allItems = @[arrowItemShake, arrowItemSweep];
    
    [self.groupArr addObject:group02];
}
//第三组
- (void)setupGroup03
{
    SettingArrowItem *arrowItemNear = [[SettingArrowItem alloc] initWithIconName:@"fujinren" titleName:@"附近人" destClass:[NearViewController class]];
    SettingArrowItem *arrowItemNearWeb = [[SettingArrowItem alloc] initWithIconName:@"dingwi" titleName:@"附近网店" destClass:[NearWebViewController class]];
    SettingGroup *group03 = [[SettingGroup alloc] init];
    group03.allItems = @[arrowItemNear, arrowItemNearWeb];
    
    [self.groupArr addObject:group03];
}
//第四组
- (void)setupGroup04
{
    SettingArrowItem *arrowItemInsurance = [[SettingArrowItem alloc] initWithIconName:@"fabuquqiu" titleName:@"发布保险需求" destClass:[InsuranceViewController class]];
    SettingGroup *group04 = [[SettingGroup alloc] init];
    group04.allItems = @[arrowItemInsurance];
    
    [self.groupArr addObject:group04];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

@end
