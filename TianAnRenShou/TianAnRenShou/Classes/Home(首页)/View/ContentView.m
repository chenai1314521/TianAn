//
//  ContentView.m
//  TianAn
//
//  Created by han on 15/4/8.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "ContentView.h"

@implementation ContentView

+ (instancetype)getContentView
{
    
    
    ContentView *contentView =  [[[NSBundle mainBundle] loadNibNamed:@"ContentView" owner:nil options:nil] firstObject];
    contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage resizedImage:@"bfd"]];
    return contentView;
}


- (IBAction)btnOnClick:(UIButton *)sender {
    if (self.detailActionOnClickBlock)
    {
        self.detailActionOnClickBlock(sender);
    }
}


@end
