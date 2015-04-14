//
//  HomeHeaderView.m
//  TianAn
//
//  Created by han on 15/4/8.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "HomeHeaderView.h"
#import "ContentView.h"
#import "HomeTitleViewModel.h"

#define TITLEFONT [UIFont boldSystemFontOfSize:16]

@interface HomeHeaderView ()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *moreBtn;
@end

@implementation HomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //添加子控件
        [self addDetailView];
    }
    return self;
}
#pragma mark-添加子控件
- (void)addDetailView
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    NSString *title = @"天安人寿";
    titleLabel.text = title;
    titleLabel.font = TITLEFONT;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    UIButton *moreBtn = [[UIButton alloc] init];
    UIImage *bgImage = [UIImage imageNamed:@"uyt.png"];
    [moreBtn setBackgroundImage:bgImage forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(animationBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreBtn];
    self.moreBtn = moreBtn;

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.centerX = self.centerX;
    self.titleLabel.centerY = 20;
    self.titleLabel.size = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:TITLEFONT} context:nil].size;
    
    
    self.moreBtn.centerX = self.centerX;
    self.moreBtn.centerY = self.bottom - 30;
    self.moreBtn.size = CGSizeMake(30, 30);

}


#pragma mark 添加内部试图
- (void)setSudoku:(NSArray *)allDatas
{
    //总共有几行
    int totalCol = 3;
    CGFloat viewW = 84;
    CGFloat viewH = 84;
    
    
    CGFloat marginX = (self.bounds.size.width - viewW * totalCol) / (totalCol + 1);
    CGFloat marginY = 20;
    CGFloat startY = 20;
    for (int i = 0; i < 6; i++)
    {
        int row = i / totalCol;//行号
        int col = i % totalCol;//列号
        
        
        CGFloat x = marginX + (viewW + marginX) * col;
        CGFloat y = startY + marginY + (viewH + marginY) * row;
        
        
        
        //拿出xib视图
        ContentView *contentView = [ContentView getContentView];
        //加载视图
        contentView.frame = CGRectMake(x, y, viewW, viewH);
        
        HomeTitleViewModel *model = allDatas[i];
        contentView.contentIconView.image = [UIImage resizedImage:model.iconName];
        contentView.contentLabel.text = model.labelName;
        contentView.contentButton.tag = i * 100;
        
        [self addSubview:contentView];
        
        
        contentView.detailActionOnClickBlock = ^(UIButton *btn)
        {
#warning 头视图中小试图的点击事件
        };
    }
    
}




- (void)animationBtnOnClick {
    if (self.animationBtnOnClickBlock)
    {
        self.animationBtnOnClickBlock();
    }
}


@end
