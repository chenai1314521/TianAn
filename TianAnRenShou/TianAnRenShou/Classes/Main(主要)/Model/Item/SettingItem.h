//
//  SettingItem.h
//  TianAn
//
//  Created by han on 15/3/27.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^myTouchBlock)();
@interface SettingItem : NSObject
/**
 *  标题图片名称
 */
@property (copy, nonatomic) NSString *iconName;

/**
 *  标题
 */
@property (copy, nonatomic) NSString *titleName;
/**
 *  副标题图片名称
 */
@property (copy, nonatomic) NSString *subtitleImageName;

/**
 *  副标题
 */
@property (copy, nonatomic) NSString *subTitle;


//新消息
@property (assign, nonatomic) BOOL newAlert;

@property (copy, nonatomic) myTouchBlock touchBlock;


//便利初始化函数
- (instancetype)initWithIconName:(NSString *)iconName titleName:(NSString *)titleName;

@end
