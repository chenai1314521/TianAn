//
//  HomeFooderView.h
//  TianAn
//
//  Created by han on 15/4/8.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myDragActionBlock)(id);


@interface HomeFooderView : UIView

@property (copy, nonatomic) myDragActionBlock dragActionBlock;

+ (instancetype)getHomeFooderView;
@end
