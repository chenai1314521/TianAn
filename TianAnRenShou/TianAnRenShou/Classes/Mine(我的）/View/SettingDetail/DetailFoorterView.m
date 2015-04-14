//
//  DetailFoorterView.m
//  TianAn
//
//  Created by han on 15/4/1.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "DetailFoorterView.h"


@interface DetailFoorterView ()


- (IBAction)quitBtnOnClick:(UIButton *)sender;


@end

@implementation DetailFoorterView

+ (instancetype)foorterView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"DetailFoorterView" owner:nil options:nil] firstObject];
}
- (IBAction)quitBtnOnClick:(UIButton *)sender {
    
    if (self.quitBtnOnClickBlock)
    {
        self.quitBtnOnClickBlock();
    }
    
}
@end
