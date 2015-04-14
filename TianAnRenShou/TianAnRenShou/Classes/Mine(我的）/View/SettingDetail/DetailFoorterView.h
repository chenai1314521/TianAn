//
//  DetailFoorterView.h
//  TianAn
//
//  Created by han on 15/4/1.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myQuitBtnOnClickBlock)();


@interface DetailFoorterView : UIView

@property (copy, nonatomic) myQuitBtnOnClickBlock quitBtnOnClickBlock;

+ (instancetype)foorterView;

@end
