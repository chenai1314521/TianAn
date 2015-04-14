//
//  HomeDetailHeadView.h
//  TianAnRenShou
//
//  Created by han on 15/4/13.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^myDismisBlock)();
@interface HomeDetailHeadView : UIView


- (void)setSudoku:(NSArray *)allDatas;

@property (copy, nonatomic) myDismisBlock dicmisBlock;
@end
