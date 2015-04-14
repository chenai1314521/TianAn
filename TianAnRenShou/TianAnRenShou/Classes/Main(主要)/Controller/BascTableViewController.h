//
//  BascTableViewController.h
//  TianAn
//
//  Created by han on 15/3/27.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SettingArrowItem.h"
#import "SettingItem.h"
#import "SettingGroup.h"
#import "SettingCell.h"
#import "SettingLabelItem.h"

@interface BascTableViewController : UITableViewController

/**
 *  存储所有的组数据
 */
@property (strong, nonatomic) NSArray *datas;

@end
