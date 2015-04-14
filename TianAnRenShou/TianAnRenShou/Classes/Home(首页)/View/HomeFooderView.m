//
//  HomeFooderView.m
//  TianAn
//
//  Created by han on 15/4/8.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "HomeFooderView.h"

@implementation HomeFooderView
+ (instancetype)getHomeFooderView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HomeFooderView" owner:nil options:nil] firstObject];
}



@end
