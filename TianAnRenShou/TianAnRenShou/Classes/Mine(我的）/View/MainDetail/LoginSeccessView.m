//
//  LoginSeccessView.m
//  TianAn
//
//  Created by han on 15/4/2.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "LoginSeccessView.h"

@implementation LoginSeccessView

+ (instancetype)getLoginSeccessView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"LoginSeccessView" owner:nil options:nil] firstObject];
}



- (IBAction)touchLoginSeccessView:(id)sender {
    if (self.touchLoginFailureViewBlock)
    {
        self.touchLoginFailureViewBlock();
    }
}



@end
