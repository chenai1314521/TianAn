//
//  HomeViewController.m
//  TianAnRenShou
//
//  Created by han on 15/4/13.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderView.h"
#import "ContentView.h"
#import "HomeTitleViewModel.h"
#import "HomeFooderView.h"
#import "HomeDetailHeadView.h"
#import "HomeDetailViewController.h"
#import "SKBounceAnimation.h"
#define AnimateDuration 0.8
#define ShakingDuration 2.0f


@interface HomeViewController ()<UIScrollViewDelegate, HomeDetailViewControllerDelegate>
{
    //记录scrollerView当前的位置
    int _lastPosition;
    //记录头试图原始center的Y坐标
    CGFloat _headerY;
    //记录尾试图原始center的Y坐标
    CGFloat _fooderY;
    //判断当前试图是否应该消失
    BOOL _dismisMainView;
    //判断scrollerView是否在顶端
    BOOL _isOnTop;
}


@property (strong, nonatomic) UIScrollView *allScreenScrollView;

//存储模型数据
@property (strong, nonatomic) NSArray *homeTitleDatas;
@property (strong, nonatomic) HomeHeaderView *homeHeaderView;
@property (strong, nonatomic) HomeFooderView *homeFooderView;



@end

@implementation HomeViewController

#pragma mark 懒加载
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


- (void)loadView
{
    self.allScreenScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.allScreenScrollView.delegate = self;
    self.view = self.allScreenScrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //细节的处理
    [self setDetailDescription];
    
    //添加头试图
    [self setupHomeHeaderView];
    
    
    //添加尾部试图
    [self setupHomeFooderView];
}

#pragma mark UIScrollViewDelegate
#pragma mark-监听scrollView的向上或向下滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 升级版：到达顶部或底部时不会反弹
    int currentPostion = scrollView.contentOffset.y;
    if (currentPostion - _lastPosition > 20  && currentPostion > 0) {        //这个地方加上 currentPostion > 0 即可）
        _lastPosition = currentPostion;
        scrollView.bounces = YES;
    }
    else if ((_lastPosition - currentPostion > 20) && (currentPostion  <= scrollView.contentSize.height-scrollView.bounds.size.height-20) ){
        _lastPosition = currentPostion;
        scrollView.bounces = NO;
    }
}
#pragma mark 只有当最初scrollerView处于顶端时，才有分卡效果的动画
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y == -20)
    {
        _isOnTop = YES;
    }
    else
    {
        _isOnTop = NO;
    }
    
}

#pragma mark 当手指离开屏幕时，判断是恢复原状还是跳转
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    if (_dismisMainView)
    {
        [self beginDismisAnimation];
    }
    else
    {
        [self addBounceAnimation:self.homeHeaderView offset:_headerY];
        [self addBounceAnimation:self.homeFooderView offset:_fooderY];
        
    }
    
    
}

#pragma mark Y值方向上的弹跳恢复动画
- (void)addBounceAnimation:(UIView *)bouncingView offset:(float)offset
{
    NSString *keyPath = @"position.y";
    
    id finalValue = [NSNumber numberWithFloat:offset];
    
    SKBounceAnimation *bounceAnimation = [SKBounceAnimation animationWithKeyPath:keyPath];
    bounceAnimation.fromValue = [NSNumber numberWithFloat:bouncingView.center.y];
    bounceAnimation.toValue = finalValue;
    bounceAnimation.duration = ShakingDuration;
    bounceAnimation.numberOfBounces = 4;
    bounceAnimation.stiffness = SKBounceAnimationStiffnessLight;
    bounceAnimation.shouldOvershoot = YES;
    
    [bouncingView.layer addAnimation:bounceAnimation forKey:@"someKey"];
    
    [bouncingView.layer setValue:finalValue forKeyPath:keyPath];
}


#pragma mark 细节的处理
- (void)setDetailDescription
{
    //为scrollerView的pan手势添加事件
    [self.allScreenScrollView.panGestureRecognizer addTarget:self action:@selector(touches:)];
    self.navigationController.navigationBar.hidden = YES;
    [self.allScreenScrollView setBackgroundColor:[UIColor colorWithRed:0 green:0.64 blue:0.49 alpha:1]];
}


#pragma mark添加尾部试图
- (void)setupHomeFooderView
{
    HomeFooderView *homeFooder = [HomeFooderView getHomeFooderView];
    homeFooder.top = CGRectGetMaxY(self.homeHeaderView.frame);
    homeFooder.width = SCREEN_WIDTH;
    [self.allScreenScrollView addSubview:homeFooder];
    self.homeFooderView = homeFooder;
    
    CGFloat contentHeight = CGRectGetMaxY(self.homeFooderView.frame);
    self.allScreenScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, contentHeight);
    
    
#warning 需要优化，为什么等于原来的center就不行呢？
    //    if (SCREEN_HEIGHT == 568)
    //    {
    //        _fooderY = self.homeFooderView.centerY - 30;
    //    }
    //    else if (SCREEN_HEIGHT == 480)
    //    {
    //        _fooderY = self.homeFooderView.centerY - SCREEN_HEIGHT * 0.18;
    //    }
    //    else
    {
        _fooderY = self.homeFooderView.centerY;
    }
}


#pragma mark 点击下拉按钮后界面消失
- (void)beginDismisAnimation
{
    //    [self.tabBarController.tabBar setBackgroundColor:[UIColor colorWithRed:0 green:0.64 blue:0.49 alpha:1]];
    //    self.tabBarController.tabBar.backgroundImage = nil;
    [UIView animateWithDuration:AnimateDuration animations:^{
        //主页消失
        [self dismissMainView];
        // self.tabBarController.tabBar.centerY += 44;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:AnimateDuration animations:^{
            
            //跳转到下个页面
            HomeDetailViewController *VC = [[HomeDetailViewController alloc] init];
            VC.delegate = self;
            [VC.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_beijing"]]];
            [self.navigationController pushViewController:VC animated:NO];
        } completion:^(BOOL finished) {
        }];
    }];
    
}
#pragma mark-HomeDetailViewControllerDelegate
#pragma mark 通知使界面恢复原状
- (void)dismisVC:(HomeDetailViewController *)vc
{
    [UIView animateWithDuration:AnimateDuration animations:^{
        [self appearMainView];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark 显示主界面
- (void)appearMainView
{
    self.homeFooderView.centerY = _fooderY;
    self.homeHeaderView.centerY = _headerY;
}

#pragma mark 主视图消失
- (void)dismissMainView
{
    self.homeHeaderView.centerY -= (_headerY + 300);
    self.homeFooderView.centerY += (_fooderY - 44);
}

#pragma mark 添加头试图
- (void)setupHomeHeaderView
{
    
    //HomeHeaderView *homeHeader = [HomeHeaderView getHomeHeaderView];
    HomeHeaderView *homeHeader = [[HomeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT / 2.2)];
    __weak typeof(self)weakSelf = self;
    
    homeHeader.animationBtnOnClickBlock = ^{
        __strong typeof(weakSelf)strongSelf = weakSelf;
        //点击下拉按钮后界面消失
        [strongSelf beginDismisAnimation];
    };
    
    [self.allScreenScrollView addSubview:homeHeader];
    self.homeHeaderView = homeHeader;
    
    //添加内部试图
    [self addContentView];
    
    _headerY = self.homeHeaderView.centerY;
    
}


#pragma mark 添加内部试图
- (void)addContentView
{
    [self.homeHeaderView setSudoku:self.homeTitleDatas];
}


#pragma mark 为scrollerView的pan手势添加事件
- (void)touches:(UIPanGestureRecognizer *)sender
{
    CGFloat contentOffSetY = self.allScreenScrollView.contentOffset.y;
    
    if (_isOnTop && contentOffSetY == -20)
    {
        CGPoint point1 = [sender translationInView:sender.view];
        //手指拖动，让自定义的view也跟着手指移动
        CGPoint temp = self.homeFooderView.center;
        CGPoint temp1 = self.homeHeaderView.center;
        //temp.x += point1.x;//0 += 1    1 += 2 = 3
        temp.y += point1.y;
        temp1.y -= point1.y;
        
        self.homeFooderView.center = temp;
        self.homeHeaderView.center = temp1;
        
        [sender setTranslation:CGPointZero inView:sender.view];
        
        if (abs(temp1.y - temp.y) > 565)
        {
            _dismisMainView = YES;
        }
        else
        {
            _dismisMainView = NO;
        }
    }
}

@end
