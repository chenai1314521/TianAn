//
//  BascTableViewController.m
//  TianAn
//
//  Created by han on 15/3/27.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "BascTableViewController.h"

@interface BascTableViewController ()

@end

@implementation BascTableViewController

/**
 *  懒加载
 */
- (NSArray *)datas
{
    if (!_datas)
    {
        _datas = [NSArray array];
    }
    return _datas;
}

/**
 *  重写init方法，设为分组显示
 */
- (instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped])
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //去除分割线
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置背景颜色图片
//    UIImage *backgroundColorImage = [UIImage imageNamed:@"settingbackgrounbeijin"];
//    self.tableView.backgroundColor = [UIColor colorWithPatternImage:backgroundColorImage];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.94 green:0.93 blue:0.96 alpha:1];

    //将背景图片设为空，否则背景色无法显示
    self.tableView.backgroundView = nil;
}

#pragma mark - Table view data source
//共几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.datas.count;
}
//每组几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SettingGroup *group = self.datas[section];
    
    return group.allItems.count;
}

//展示数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建自定义cell
    SettingCell *cell = [SettingCell settingItemWithTableView:tableView];
    //取出组数据
    SettingGroup *group = self.datas[indexPath.section];
    //取出行数据
    SettingItem *item = group.allItems[indexPath.row];
    //赋值
    cell.settingItem = item;
    return cell;
}

//跳转到新的页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    //取消选择
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    SettingGroup *group = self.datas[indexPath.section];
    SettingItem *item = group.allItems[indexPath.row];
    
    
    if (item.touchBlock)
    {
        item.touchBlock();
    }
    //如果是箭头标志的话跳转到新的页面
    else if ([item isKindOfClass:[SettingArrowItem class]])
    {
        SettingArrowItem *arrowItem = (SettingArrowItem *)item;
        UIViewController *VC = [[arrowItem.destClass alloc] init];
        //跳转页面的标题为本行的标题
        VC.title = item.titleName;
        
        [self.navigationController pushViewController:VC animated:YES];
    }
}

//设置头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SettingGroup *group = self.datas[section];
    NSString *header = group.header;
    return header;
}
//设置foorter
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    SettingGroup *group = self.datas[section];
    NSString *footer = group.footer;
    return footer;
    
 
}

//设置Header高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
//设置Footer高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}


























/*
//显示tabBar
- (void)viewWillAppear:(BOOL)animated
{
    [self showTabBar];
}
//显示tabBar
- (void)showTabBar
{
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = NO;
    
}
*/
@end
