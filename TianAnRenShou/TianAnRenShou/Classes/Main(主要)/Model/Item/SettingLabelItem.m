//
//  SettingLabelItem.m
//  TianAn
//
//  Created by han on 15/4/1.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "SettingLabelItem.h"

@implementation SettingLabelItem
- (instancetype)initWithTitleName:(NSString *)titleName subTitle:(NSString *)subTitle
{
    self = [super init];
    if (self)
    {
        self.titleName = titleName;
        self.subTitle = subTitle;
    }
    return self;
}
@end
