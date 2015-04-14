//
//  SettingGroup.h
//  TianAn
//
//  Created by han on 15/3/27.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject
/**
 *  标题
 */
@property (copy, nonatomic) NSString *header;
/**
 *  尾部
 */
@property (copy, nonatomic) NSString *footer;
/**
 *  存储所有的SettingItem
 */
@property (strong, nonatomic) NSArray *allItems;
@end
