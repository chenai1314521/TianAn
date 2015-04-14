//
//  HomeTitleViewModel.h
//  TianAn
//
//  Created by han on 15/4/8.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeTitleViewModel : NSObject
@property (copy, nonatomic) NSString *iconName;
@property (copy, nonatomic) NSString *labelName;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
