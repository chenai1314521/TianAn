//
//  SettingCellTableViewCell.h
//  TianAn
//
//  Created by han on 15/3/27.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <UIKit/UIKit.h>
//测试数据
typedef void(^MyPaiZhaoImageBlock)(UIImage *);

@class SettingItem;

@interface SettingCell : UITableViewCell

@property (copy, nonatomic) MyPaiZhaoImageBlock paiZhaoImageBlock;

/**
 *  模型
 */
@property (strong, nonatomic) SettingItem *settingItem;


//重用cell
- (instancetype)initWithTableView:(UITableView *)tableView;
+ (instancetype)settingItemWithTableView:(UITableView *)tableView;

@end
