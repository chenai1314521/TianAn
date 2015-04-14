//
//  LoginViewController.m
//  TianAn
//
//  Created by han on 15/3/31.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+NJ.h"

#define DURATION 0.2

@interface LoginViewController () <UIScrollViewDelegate>
{
    //判断loginView是否弹出
    BOOL popBol;
    
    //检测scrollerView向上或向下滑动
    //int _lastPosition;
}

@property (strong, nonatomic) IBOutlet UIScrollView *backgroundScrollView;
//登录名
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
//密码
@property (strong, nonatomic) IBOutlet UITextField *userPwdTextField;

//登录按钮
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;

//箭头所在的view
@property (strong, nonatomic) IBOutlet UIView *minView;


//登录按钮所在的View
@property (strong, nonatomic) IBOutlet UIView *loginView;

//箭头图标
@property (strong, nonatomic) IBOutlet UIImageView *arrowImageView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    //对xib文件进行微调整
    [self setupXibViewDetail];
    
    //设置buttonBarItem
    [self setupButtonItem];

}
//对xib文件进行微调整
- (void)setupXibViewDetail
{
    //设置圆角
    self.loginBtn.layer.cornerRadius = 20.0;
    self.backgroundScrollView.backgroundColor = setColor(236, 236, 236, 1);
    self.minView.backgroundColor = setColor(236, 236, 236, 1);
    self.view.backgroundColor = setColor(236, 236, 236, 1);
    CGFloat contentW = self.backgroundScrollView.width;
    CGFloat contentH = self.backgroundScrollView.height;
    self.backgroundScrollView.contentSize = CGSizeMake(contentW, contentH + 70);
}

//设置buttonBarItem
- (void)setupButtonItem
{
    //返回按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"guanbi"] forState:UIControlStateNormal];

    CGFloat leftBtnW = SCREEN_WIDTH / 13.0;
    CGFloat leftBtnH = leftBtnW;
    leftBtn.bounds = CGRectMake(0, 0, leftBtnW, leftBtnH);
    
    //[leftBtn setTitle:@"未知" forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [leftBtn addTarget:self action:@selector(cloes:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *lefBBI = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = lefBBI;
    
    //注册按钮
    UIBarButtonItem *registItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registerBtnOnClick)];
    registItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = registItem;
}

//dismissViewController
- (void)cloes:(UIBarButtonItem *)closeItem
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


// scrollView 已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self.userNameTextField isFirstResponder])
    {
        [self.userNameTextField resignFirstResponder];
    }
    else if ([self.userPwdTextField isFirstResponder])
    {
        [self.userPwdTextField resignFirstResponder];
    }

    if (popBol)
    {
        [self popLoginView];
    }

    //判断scrollerView向上拖动或向下拖动
//    int currentPostion = scrollView.contentOffset.y;
//    if (currentPostion - _lastPosition > 25)
//    {
//        _lastPosition = currentPostion;
//        
//    }
//    else if (_lastPosition - currentPostion > 25)
//    {
//        _lastPosition = currentPostion;
//        
//    }

}


//点击箭头弹出view
- (IBAction)arrowOnClick:(UITapGestureRecognizer *)sender {
    
    [self popLoginView];
}

//点击scrollView
- (IBAction)scrollViewOnClick:(id)sender
{
    if (popBol)
    {
        [self popLoginView];
    }
    
}

//拖拽登录view
- (IBAction)loginViewDrag:(id)sender {
    [self popLoginView];
}


//弹出的动画操作
- (void)popLoginView
{

    CGFloat loginViewChangeTopOrig = self.loginView.top;
    
    if (popBol)//登录view已经弹出
    {
        [self loginViewDown:loginViewChangeTopOrig];
    }
    else//登录view还未弹出
    {
        //弹出动画
        [self loginViewUp:loginViewChangeTopOrig];
    }
    
       popBol = !popBol;
}

- (void)loginViewUp:(CGFloat)loginViewChangeTopOrig
{
    //弹出动画
    [UIView animateWithDuration:DURATION animations:^{
        self.loginView.top -= 55;
        
    } completion:^(BOOL finished) {
        
        //延迟加载改变箭头的方向
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DURATION * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (loginViewChangeTopOrig != self.loginView.top)
            {
                [UIView animateWithDuration:DURATION animations:^{
                    self.arrowImageView.image = [UIImage resizedImage:@"shangla"];
                }];
            }
        });
        
        
    }];

}
- (void)loginViewDown:(CGFloat)loginViewChangeTopOrig
{
    [UIView animateWithDuration:DURATION animations:^{
        self.loginView.top += 55;
        
        
    } completion:^(BOOL finished)
     {
         //延迟加载改变箭头的方向
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DURATION * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             if (loginViewChangeTopOrig != self.loginView.top)
             {
                 [UIView animateWithDuration:DURATION animations:^{
                     self.arrowImageView.image = [UIImage resizedImage:@"xiala"];
                 }];
             }
         });
         
         
     }];

}








//注册按钮点击事件
- (void)registerBtnOnClick
{
    
}


//登录按钮
- (IBAction)loginBtnOnClick:(UIButton *)sender {
    
    [MBProgressHUD showMessage:@"正在登录，请稍后"];
#warning 测试
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        [MBProgressHUD showSuccess:@"登陆成功"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    });
    
}
//忘记密码
- (IBAction)forgetPwdOnClick:(UIButton *)sender {
}



//微信登录
- (IBAction)weixin:(UIButton *)sender {
}


//QQ登录
- (IBAction)qqBtnOnClick:(UIButton *)sender {
}


//新浪登录
- (IBAction)xinlangBtnOnClick:(UIButton *)sender {
}





@end
