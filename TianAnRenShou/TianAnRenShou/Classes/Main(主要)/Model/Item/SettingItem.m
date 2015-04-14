//
//  SettingItem.m
//  TianAn
//
//  Created by han on 15/3/27.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem


- (instancetype)initWithIconName:(NSString *)iconName titleName:(NSString *)titleName
{
    self = [super init];
    if (self)
    {
        self.iconName = iconName;
        self.titleName = titleName;
    }
    return self;
}
@end
