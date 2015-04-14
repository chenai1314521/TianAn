//
//  LoginFailureView.h
//  TianAn
//
//  Created by han on 15/4/2.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myLoginFailureViewBlock)();
@interface LoginFailureView : UIView

@property (copy, nonatomic) myLoginFailureViewBlock loginFailureViewBlock;

+ (instancetype)getLoginFailureView;
@end
