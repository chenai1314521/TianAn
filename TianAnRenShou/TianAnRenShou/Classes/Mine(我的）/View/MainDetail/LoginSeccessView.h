//
//  LoginSeccessView.h
//  TianAn
//
//  Created by han on 15/4/2.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myTouchLoginFailureViewBlock)();

@interface LoginSeccessView : UIView

@property (copy, nonatomic) myTouchLoginFailureViewBlock touchLoginFailureViewBlock;

+ (instancetype)getLoginSeccessView;


@end
