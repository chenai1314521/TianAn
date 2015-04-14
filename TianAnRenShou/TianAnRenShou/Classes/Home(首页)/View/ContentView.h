//
//  ContentView.h
//  TianAn
//
//  Created by han on 15/4/8.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myDetailActionOnClickBlock)(UIButton *);

@interface ContentView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *contentIconView;


@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UIButton *contentButton;


@property (copy, nonatomic) myDetailActionOnClickBlock detailActionOnClickBlock;

+ (instancetype)getContentView;





@end
