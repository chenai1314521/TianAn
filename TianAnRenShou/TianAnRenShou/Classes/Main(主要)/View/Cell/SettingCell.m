//
//  SettingCellTableViewCell.m
//  TianAn
//
//  Created by han on 15/3/27.
//  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
//

#import "SettingCell.h"
#import "SettingItem.h"
#import "SettingArrowItem.h"
#import "SettingLabelItem.h"

@interface SettingCell ()
/**
 *  标题view
 */
@property (strong, nonatomic) UIImageView *iconView;
/**
 *  副标题view
 */
@property (strong, nonatomic) UIImageView *subtitleView;

@property (strong, nonatomic) UILabel *myLabel;
//分割线
@property (strong, nonatomic) UIView *divider;

/**
 *  副标题image的size
 */
@property (assign, nonatomic) CGSize subViewSize;

//新消息提醒
@property (strong, nonatomic) UIImageView *badgeValue;

@end

@implementation SettingCell
//
//-(void)setFrame:(CGRect)frame
//{
//    if (!iOS7) {
//        frame.origin.x -= 10;
//        frame.size.width += 20;
//    }
//    [super setFrame:frame];
//}

- (UIImageView *)badgeValue
{
    if (!_badgeValue)
    {
        _badgeValue = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yuandian"]];
    }
    return _badgeValue;
}


-(UILabel *)myLabel
{
    if (!_myLabel) {
        _myLabel = [[UILabel alloc]init];
        _myLabel.frame = CGRectMake(0, 0, 150, 43);
        //_myLabel.backgroundColor = [UIColor redColor];
        _myLabel.textAlignment = NSTextAlignmentRight;
        _myLabel.font = DETAILLABELFONT;
        _myLabel.textColor = setColor(135, 134, 134, 1);
    }
    return _myLabel;
}
////根据字体确定label的大小
//- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
//{
//    NSDictionary *dict = @{NSFontAttributeName:font};
//    
//    
//    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
//    
//    return size;
//}



- (UIImageView *)iconView
{
    if (!_iconView)
    {
#warning 填写 箭头图片
        UIImage *arrowImage = [UIImage imageNamed:@"settingjiant"];
        _iconView = [[UIImageView alloc] initWithImage:arrowImage];
    }
    return _iconView;
}

- (UIImageView *)subtitleView
{
    if (!_subtitleView)
    {
        _subtitleView = [[UIImageView alloc] init];

    }
    return _subtitleView;
}

//重写set方法，添加cell上的控件
- (void)setSettingItem:(SettingItem *)settingItem
{
    _settingItem = settingItem;
    
    self.textLabel.text = settingItem.titleName;
    self.textLabel.font = [UIFont systemFontOfSize:16];
    self.textLabel.textColor = setColor(62, 62, 62, 1);
    self.imageView.image = [UIImage imageNamed:settingItem.iconName];
    
    //新消息提醒
    if (settingItem.newAlert)
    {
        self.badgeValue.hidden = NO;
    }
    else
    {
        self.badgeValue.hidden = YES;
    }

    
    //如果cell是箭头，设置子控件
    if ([settingItem isKindOfClass:[SettingArrowItem class]])
    {
        self.accessoryView = self.iconView;
        
            UIImage *subImage = [UIImage imageNamed:settingItem.subtitleImageName];
            self.subViewSize = subImage.size;
            self.subtitleView.image = subImage;
        
        
        self.detailTextLabel.text = self.settingItem.subTitle;
        self.detailTextLabel.font = DETAILLABELFONT;
        
    }
    else if ([settingItem isKindOfClass:[SettingLabelItem class]])
    {
        self.accessoryView = self.myLabel;
        self.myLabel.text = settingItem.subTitle;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else//必须设置，否则会出错
    {
        self.accessoryView = nil;
    }
    
}

//重写方法，添加子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // 设置cell的背景
        UIView *norView = [[UIView alloc]init];
        norView.backgroundColor = [UIColor whiteColor];
        self.backgroundView = norView;

        // 去掉子控件的背景
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.backgroundColor = [UIColor clearColor];
        
        // 分割线
        UIView *divider = [[UIView alloc]init];
        divider.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tableViewxiantiao"]];
        [self.contentView addSubview:divider];
        divider.alpha = .6;
        self.divider = divider;
        
        [self.contentView addSubview:self.subtitleView];
        [self.contentView addSubview:self.badgeValue];
    }
    return self;
    
}
//重写方法，设置frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    /*
    CGFloat subH = SUBTITLEIMAGEH;
    CGFloat subW = subH;
    CGFloat subX = self.accessoryView.left * 0.95 - subW;
    CGFloat subY = PADDINGPERSON;
    self.subtitleView.frame = CGRectMake(subX, subY, subW, subH);*/
    
    //副试图的frame；
    CGFloat subY = 8;
    CGFloat subH = self.height - subY * 2;
    CGFloat subW = subH;
    CGFloat subX = self.accessoryView.left * 0.95 - subW;
    self.subtitleView.frame = CGRectMake(subX, subY, subW, subH);
    
    //新消息的frame
    CGFloat badgeValueH = 6;
    CGFloat badgeValueW = 6;
    CGFloat badgeValueX = subX + subW - badgeValueW / 2;
    CGFloat badgeValueY = subY - badgeValueH / 2;
    self.badgeValue.frame = CGRectMake(badgeValueX, badgeValueY, badgeValueW, badgeValueH);
    
    
    self.divider.frame = CGRectMake(0, self.frame.size.height - 1, [UIScreen mainScreen].bounds.size.width, 1);
}


- (instancetype)initWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Cell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell)
    {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

+ (instancetype)settingItemWithTableView:(UITableView *)tableView
{
    return [[SettingCell alloc] initWithTableView:tableView];
}

@end
