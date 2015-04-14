//
//  HomeHeaderView.h
//  TianAn
//
//  Created by han on 15/4/8.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeTitleViewModel;

typedef void(^myAnimationBtnOnClickBlock)();

@interface HomeHeaderView : UIView

@property (copy, nonatomic) myAnimationBtnOnClickBlock animationBtnOnClickBlock;

- (void)setSudoku:(NSArray *)allDatas;
@end
