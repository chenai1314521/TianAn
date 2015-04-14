//
//  HomeDetailViewController.m
//  TianAn
//
//  Created by han on 15/4/9.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "HomeDetailHeadView.h"
#import "HomeTitleViewModel.h"
@interface HomeDetailViewController ()
@property (strong, nonatomic) NSArray *homeTitleDatas;
@property (strong, nonatomic) HomeDetailHeadView *homeDetailHeaderView;
@end

@implementation HomeDetailViewController

- (NSArray *)homeTitleDatas
{
    if (!_homeTitleDatas)
    {
        NSArray *allArr = @[@{
                                @"iconName":@"erd",
                                @"labelName":@"三口之家",
                                },
                            @{
                                @"iconName":@"ssds",
                                @"labelName":@"全家福",
                                },
                            @{
                                @"iconName":@"sanjk",
                                @"labelName":@"剩男剩女",
                                },
                            @{
                                @"iconName":@"wqwq",
                                @"labelName":@"热卖组合",
                                },
                            @{
                                @"iconName":@"zichan",
                                @"labelName":@"投资理财",
                                },
                            @{
                                @"iconName":@"shdc",
                                @"labelName":@"交通意外",
                                },
                            @{
                                @"iconName":@"Home_open_qianbao",
                                @"labelName":@"我的钱包",
                                },
                            @{
                                @"iconName":@"Home_open_anis",
                                @"labelName":@"我的资料",
                                },
                            @{
                                @"iconName":@"Home_open_diqiu",
                                @"labelName":@"我的消息",
                                },
                            @{
                                @"iconName":@"Home_open_shoucwe",
                                @"labelName":@"收藏",
                                },
                            @{
                                @"iconName":@"Home_open_daizi",
                                @"labelName":@"一起赚",
                                },
                            ];
        NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:allArr.count];
        for (NSDictionary *dict in allArr)
        {
            HomeTitleViewModel *moedl = [[HomeTitleViewModel alloc] initWithDict:dict];
            [tempArr addObject:moedl];
        }
        _homeTitleDatas = tempArr;
        
    }
    return _homeTitleDatas;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.homeDetailHeaderView = [HomeDetailHeadView getHomeDetailHeaderView];
    self.homeDetailHeaderView = [[HomeDetailHeadView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    __weak typeof(self)weakSelf = self;
    self.homeDetailHeaderView.dicmisBlock = ^{
        //防止内存泄露
        __strong typeof(weakSelf)strongSelf=weakSelf;
        if ([strongSelf.delegate respondsToSelector:@selector(dismisVC:)])
        {
            [strongSelf.delegate dismisVC:strongSelf];
        }
        [strongSelf.navigationController popViewControllerAnimated:NO];
    };
    [self.homeDetailHeaderView setSudoku:self.homeTitleDatas];
    [self.view addSubview:self.homeDetailHeaderView];
}

@end
