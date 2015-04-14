//
//  HomeTitleViewModel.m
//  TianAn
//
//  Created by han on 15/4/8.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "HomeTitleViewModel.h"

@implementation HomeTitleViewModel
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.iconName = dict[@"iconName"];
        self.labelName = dict[@"labelName"];
    }
    return self;
}

@end
