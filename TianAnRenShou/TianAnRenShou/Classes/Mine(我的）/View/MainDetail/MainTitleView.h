//
//  MainTitleView.h
//  TianAn
//
//  Created by han on 15/4/2.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^myCollectionBtnOnClickBlock)();

typedef void(^myWalletBtnOnClickBlock)();

typedef void(^myCardbagBtnOnClickBlock)();

typedef void(^myRealnameBtnOnClickBlock)();





@interface MainTitleView : UIView



@property (copy, nonatomic) myCollectionBtnOnClickBlock collectionBtnOnClickBlock;


+ (instancetype)getMainTitleView;


@end
