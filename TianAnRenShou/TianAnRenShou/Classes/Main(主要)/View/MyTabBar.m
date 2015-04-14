//
//  MyTabBar.m
//  TianAnRenShou
//
//  Created by han on 15/4/11.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "MyTabBar.h"

@interface MyTabBar()

@property (strong, nonatomic) UIButton *voiceBtn;

@end

@implementation MyTabBar
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundImage = [UIImage resizedImage:@"tabbar_background"];
        
        //self.selectionIndicatorImage = [UIImage resizedImage:@"tabbar_background"];
        
        
        // 添加加号按钮
        [self setupPlusButton];
    }
    return self;
}

/**
 *  添加加号按钮
 */
- (void)setupPlusButton
{
    UIButton *voiceBtn = [[UIButton alloc] init];
    // 设置背景
    [voiceBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_voice"] forState:UIControlStateNormal];
//    [voiceBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_voice_highlighted"] forState:UIControlStateHighlighted];
    // 设置图标
    //[voiceBtn setImage:[UIImage imageNamed:@"tabbar_voice"] forState:UIControlStateNormal];
    //[voiceBtn setImage:[UIImage imageNamed:@"tabbar_voice_highlighted"] forState:UIControlStateHighlighted];
    [voiceBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
    // 添加
    [self addSubview:voiceBtn];
    self.voiceBtn = voiceBtn;
}

- (void)plusClick
{
    //设置代理
    if ([self.myDelegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)])
    {
        [self.myDelegate tabBarDidClickedPlusButton:self];
    }
}

/**
 *  布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置plusButton的frame
    [self setupPlusButtonFrame];
    
    // 设置所有tabbarButton的frame
    [self setupAllTabBarButtonFrame];
    
}

/**
 *  设置所有plusButton的frame
 */
- (void)setupPlusButtonFrame
{
    self.voiceBtn.size = self.voiceBtn.currentBackgroundImage.size;
    self.voiceBtn.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

/**
 *  设置所有tabbarButton的frame
 */
- (void)setupAllTabBarButtonFrame
{
    int index = 0;
    
    // 遍历所有的button
    for (UIView *tabBarButton in self.subviews)
    {
        // 如果不是UITabBarButton， 直接跳过
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        // 根据索引调整位置
        [self setupTabBarButtonFrame:tabBarButton atIndex:index];

        // 索引增加
        index++;
        
    }
}


/**
 *  设置某个按钮的frame
 *
 *  @param tabBarButton 需要设置的按钮
 *  @param index        按钮所在的索引
 */
- (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    // 计算button的尺寸
    CGFloat buttonW = self.width / (self.items.count + 1);
    CGFloat buttonH = self.height;
    
    
    tabBarButton.width = buttonW;
    tabBarButton.height = buttonH;
    if (index >= 2)
    {
        tabBarButton.left = buttonW * (index + 1);
    }
    else
    {
        tabBarButton.left = buttonW * index;
    }
    tabBarButton.top = 0;
}

//- (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
//{
//    // 计算button的尺寸
//    CGFloat buttonW = self.width / self.items.count;
//    CGFloat buttonH = self.height;
//    
//    
//    tabBarButton.width = buttonW;
//    tabBarButton.height = buttonH;
//
//    tabBarButton.left = buttonW * index;
//
//    tabBarButton.top = 0;
//}


@end
