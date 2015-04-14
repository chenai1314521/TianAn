//
//  SettingArrowItem.h
//  TianAn
//
//  Created by han on 15/3/27.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "SettingItem.h"

@interface SettingArrowItem : SettingItem

/**
 *  跳转到的页面
 */
@property (assign, nonatomic) Class destClass;


- (instancetype)initWithIconName:(NSString *)iconName titleName:(NSString *)titleName destClass:(Class)destCalsss;

@end
