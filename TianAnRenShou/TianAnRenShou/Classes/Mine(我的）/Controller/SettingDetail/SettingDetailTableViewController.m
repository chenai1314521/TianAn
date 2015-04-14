//
//  SettingDetailTableViewController.m
//  TianAn
//
//  Created by han on 15/4/1.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "SettingDetailTableViewController.h"
#import "AddressViewController.h"
#import "PastcodeViewController.h"
#import "SignatureViewController.h"
#import "TitleViewController.h"

#import "DetailFoorterView.h"

@interface SettingDetailTableViewController () <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) NSMutableArray *groupArr;

@end

@implementation SettingDetailTableViewController

/**
 *  懒加载
 */
- (NSMutableArray *)groupArr
{
    if (!_groupArr)
    {
        _groupArr = [NSMutableArray array];
    }
    return _groupArr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DetailFoorterView *foorter = [DetailFoorterView foorterView];
    foorter.quitBtnOnClickBlock = ^()
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您确定要退出吗" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    };
    self.tableView.tableFooterView = foorter;
    
    
    
    self.title = @"设置";
    
//    UserDetailModel *U = [[UserDetailModel alloc] init];
//    U.userName = @"陈贤波";
//    U.userSex = @"男";
//    U.userType = @"身份证";
//    U.userNumber = @"42032219940024212";
//    U.userBarthday = @"1976年2月4日";
//    U.userSignin = @"美好的一天从天安开始！加油";
//    U.userCode = @"100010";
//    U.userIconName = @"tupian";
    //添加组数据
    [self setupGroup01];
    [self setupGroup02];
    [self setupGroup03];
    
    
    //赋值
    self.datas = self.groupArr;
    
}



//第一组数据
- (void)setupGroup01
{
    //需要跳转的页面
    SettingArrowItem *arrowItemMyTitle = [[SettingArrowItem alloc] initWithIconName:nil titleName:@"头像" destClass:nil];
    //点击头像
    arrowItemMyTitle.touchBlock = ^{
        
        if (CurrentSystemVersion < 8.0)
        {
            [self addActionSheetOld];
        }
        else
        {
            [self addActionSheetCurrent];
        }
    };
    //添加副试图
    arrowItemMyTitle.subtitleImageName = @"tupian";
    //将数据模型添加到组模型里
    SettingGroup *group01 = [[SettingGroup alloc] init];
    group01.allItems = @[arrowItemMyTitle];
    
    [self.groupArr addObject:group01];
}
//第二组
- (void)setupGroup02
{
    //UserDetailModel *U = [UserDetailModel sharedUserDetailModel];
//    SettingLabelItem *arrowItemName = [[SettingLabelItem alloc] initWithTitleName:@"姓名" subTitle:U.userName];
//    SettingLabelItem *arrowItemSex = [[SettingLabelItem alloc] initWithTitleName:@"性别" subTitle:U.userSex];
//    SettingLabelItem *arrowItemDocumentsType = [[SettingLabelItem alloc] initWithTitleName:@"证件类型" subTitle:U.userType];
//    SettingLabelItem *arrowItemDocumentsNumber = [[SettingLabelItem alloc] initWithTitleName:@"证件号码" subTitle:U.userNumber];
//    SettingLabelItem *arrowItemBrithday = [[SettingLabelItem alloc] initWithTitleName:@"出生日期" subTitle:U.userBarthday];
    
    
    

    
    SettingLabelItem *arrowItemName = [[SettingLabelItem alloc] initWithTitleName:@"姓名" subTitle:@"陈贤波"];
    SettingLabelItem *arrowItemSex = [[SettingLabelItem alloc] initWithTitleName:@"性别" subTitle: @"男"];
    SettingLabelItem *arrowItemDocumentsType = [[SettingLabelItem alloc] initWithTitleName:@"证件类型" subTitle:@"身份证"];
    SettingLabelItem *arrowItemDocumentsNumber = [[SettingLabelItem alloc] initWithTitleName:@"证件号码" subTitle:@"42032219940024212"];
    SettingLabelItem *arrowItemBrithday = [[SettingLabelItem alloc] initWithTitleName:@"出生日期" subTitle: @"1976年2月4日"];

    
    SettingGroup *group02 = [[SettingGroup alloc] init];
    group02.allItems = @[arrowItemName, arrowItemSex, arrowItemDocumentsType, arrowItemDocumentsNumber, arrowItemBrithday];
    
    [self.groupArr addObject:group02];
}
//第三组
- (void)setupGroup03
{
    SettingArrowItem *arrowItemSignature = [[SettingArrowItem alloc] initWithIconName:nil titleName:@"签名" destClass:[SignatureViewController class]];
    arrowItemSignature.subTitle = @"美好的一天从天安开始！加油";
    SettingArrowItem *arrowItemAddress = [[SettingArrowItem alloc] initWithIconName:nil titleName:@"地址" destClass:[AddressViewController class]];
    SettingArrowItem *arrowItemPastcode = [[SettingArrowItem alloc] initWithIconName:nil titleName:@"邮编" destClass:[PastcodeViewController class]];
    arrowItemPastcode.subTitle = @"10010";
    SettingGroup *group03 = [[SettingGroup alloc] init];
    group03.allItems = @[arrowItemSignature, arrowItemAddress, arrowItemPastcode];
    
    [self.groupArr addObject:group03];
}
- (void)addActionSheetOld
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从手机相册选取" , nil];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}
- (void)addActionSheetCurrent
{
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self openCamera];
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"从手机相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self openAlbum];
        
    }];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [actionSheetController addAction:action0];
    [actionSheetController addAction:action1];
    [actionSheetController addAction:actionCancel];
    [actionSheetController.view setTintColor:[UIColor blackColor]];
    [self presentViewController:actionSheetController animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return PADDINGPERSON * 2 + SUBTITLEIMAGEH;
            break;
            
        default:
            break;
    }
    return 44;
}














#pragma mark-UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"拍照"])
    {
        [self openCamera];
    }
    else if ([buttonTitle isEqualToString:@"从手机相册选取"])
    {
        [self openAlbum];
    }
}
//更改sheet的字体颜色
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    for (UIView *subViwe in actionSheet.subviews)
    {
        if ([subViwe isKindOfClass:[UIButton class]])
        {
            UIButton *button = (UIButton*)subViwe;
            [button setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        }
    }
}




/**
 *  打开照相机
 */
- (void)openCamera
{
    //如果不能用，则直接返回
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) return;
    
    
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}
/**
 *  打开相册
 */
- (void)openAlbum
{
    //如果不能用，则直接返回
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    
    
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}
#pragma mark-UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    //1.取出选取的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    //2.添加图片到相册中

#warning 测试，需要删除
    UIImageView *v = [[UIImageView alloc] init];
    v.image = image;
    v.frame = CGRectMake(0, 0, 100, 100);
    self.tableView.tableHeaderView = v;
   
    
}



//最后用隐藏tabbar
- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
    
    
}
/*
 这个方法来隐藏默认的TabBar，然后在显示自定义的TabBar的时候又出现问题，就是有自定义TabBar的view push到另一个view,然后返回的时候，隐藏系统TabBar后，显示自定义的TabBar会出现闪动的现象，可以看到系统TabBar隐藏，接着视图尺寸改变，自定义的TabBar由原来被系统的TabBar挤上去的位置向底部移动，这样就影响了用户体验。
 最后试出的解决方法是：
 */
-(void) viewDidAppear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = YES;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self hideTabBar];
    
    
}


@end
