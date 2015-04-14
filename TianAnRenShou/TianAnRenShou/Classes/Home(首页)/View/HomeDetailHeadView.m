//
//  HomeDetailHeadView.m
//  TianAnRenShou
//
//  Created by han on 15/4/13.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "HomeDetailHeadView.h"
#import "ContentView.h"
#import "HomeTitleViewModel.h"

#define TITLEFONT [UIFont boldSystemFontOfSize:16]


@interface HomeDetailHeadView ()

@property (strong, nonatomic) UIScrollView *detailScrollView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *cancelBtn;


@end

@implementation HomeDetailHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //添加子控件
        [self addDetailView];
        
        //设置子控件frame
        [self settingFrame];

    }
    return self;
}
#pragma mark- 添加子控件
- (void)addDetailView
{
    UIScrollView *detailScrollView = [[UIScrollView alloc] init];
    [self addSubview:detailScrollView];
    self.detailScrollView = detailScrollView;
    
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:cancelBtn];
    self.cancelBtn = cancelBtn;
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    NSString *title = @"天安人寿";
    titleLabel.text = title;
    titleLabel.font = TITLEFONT;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

#pragma mark-设置子控件frame
- (void)settingFrame
{
    self.titleLabel.size = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:TITLEFONT} context:nil].size;
    self.titleLabel.centerX = self.centerX;
    self.titleLabel.centerY = 20;
    
    
    self.cancelBtn.size = CGSizeMake(30, 30);
    self.cancelBtn.centerX = self.centerX;
    self.cancelBtn.centerY = self.bottom - 60;
    UIImage *bgImage = [UIImage imageNamed:@"Home_open_guanbi.png"];
    [self.cancelBtn setBackgroundImage:bgImage forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self action:@selector(dismisBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.detailScrollView.width = SCREEN_WIDTH - 20;
    self.detailScrollView.height = SCREEN_HEIGHT * 0.8;
    self.detailScrollView.centerX = self.centerX;
    self.detailScrollView.top = 0;

}

#pragma mark 添加内部试图
- (void)setSudoku:(NSArray *)allDatas
{
    CGFloat contentH = 0.0;
    
    
    //总共有几行
    int totalCol = 3;
    CGFloat viewW = 84;
    CGFloat viewH = 84;
    
    
    CGFloat marginX = (self.detailScrollView.width - viewW * totalCol) / (totalCol + 1);
    CGFloat marginY = 20;
    CGFloat startY = 20;
    for (int i = 0; i < allDatas.count; i++)
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
        
        [self.detailScrollView addSubview:contentView];
        
        
        contentH = CGRectGetMaxY(contentView.frame);
        self.detailScrollView.contentSize = CGSizeMake(self.detailScrollView.width, contentH);
        
        
        contentView.detailActionOnClickBlock = ^(UIButton *btn)
        {
#warning 小试图的点击事件
        };
    }
}


- (void)dismisBtnOnClick {
    if (self.dicmisBlock)
    {
        self.dicmisBlock();
    }

}


@end
