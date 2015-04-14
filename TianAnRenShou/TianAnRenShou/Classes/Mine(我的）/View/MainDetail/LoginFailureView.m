//
//  LoginFailureView.m
//  TianAn
//
//  Created by han on 15/4/2.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "LoginFailureView.h"

@implementation LoginFailureView

+ (instancetype)getLoginFailureView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"LoginFailureView" owner:nil options:nil] firstObject];
}



- (IBAction)touchLoginFailureView:(id)sender {
    if (self.loginFailureViewBlock)
    {
        self.loginFailureViewBlock();
    }
}



@end
