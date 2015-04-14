//
//  HomeDetailViewController.h
//  TianAn
//
//  Created by han on 15/4/9.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeDetailViewController;
@protocol HomeDetailViewControllerDelegate <NSObject>

- (void)dismisVC:(HomeDetailViewController *)vc;

@end

@interface HomeDetailViewController : UIViewController
@property (assign, nonatomic) id<HomeDetailViewControllerDelegate>delegate;
@end
