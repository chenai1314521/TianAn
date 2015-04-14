//
//  SettingArrowItem.m
//  TianAn
//
//  Created by han on 15/3/27.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "SettingArrowItem.h"

@implementation SettingArrowItem
- (instancetype)initWithIconName:(NSString *)iconName titleName:(NSString *)titleName destClass:(Class)destCalsss
{
    //调用父类方法
    self = [super initWithIconName:iconName titleName:titleName];
    if (self)
    {
        self.destClass = destCalsss;
    }
    return self;
}

@end
