//
//  MainLeftBarButton.m
//  TianAn
//
//  Created by han on 15/4/2.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "MainLeftBarButton.h"

@implementation MainLeftBarButton

+ (instancetype)getMainLeftBarButton
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MainLeftBarButton" owner:nil options:nil] firstObject];
}



- (IBAction)eMailBtnTouchUpInside {
    if (self.emaillBtnTouchUpInset)
    {
        self.emaillBtnTouchUpInset();
    }
}




@end
