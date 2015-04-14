//
//  MainTitleView.m
//  TianAn
//
//  Created by han on 15/4/2.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "MainTitleView.h"


@interface MainTitleView ()



//头像
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
//用户名
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
//用户签名
@property (strong, nonatomic) IBOutlet UILabel *userSignLabel;


- (IBAction)collectionBtnOnClick:(id)sender;

- (IBAction)walletBtnOnClick:(id)sender;


- (IBAction)cardbagBtnOnClick:(id)sender;


- (IBAction)realnameBtnOnClick:(id)sender;








@end


@implementation MainTitleView

+ (instancetype)getMainTitleView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MainTitleView" owner:nil options:nil] firstObject];
}



- (IBAction)collectionBtnOnClick:(id)sender {
    if (self.collectionBtnOnClickBlock)
    {
        self.collectionBtnOnClickBlock();
    }
}

- (IBAction)walletBtnOnClick:(id)sender {
}

- (IBAction)cardbagBtnOnClick:(id)sender {
}

- (IBAction)realnameBtnOnClick:(id)sender {
}
@end
