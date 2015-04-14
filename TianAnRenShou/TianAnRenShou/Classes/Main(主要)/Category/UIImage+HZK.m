//
//  UIImage+HZK.m
//  TianAnRenShou
//
//  Created by han on 15/4/11.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import "UIImage+HZK.h"

@implementation UIImage (HZK)


//注意：对图片进行保护性拉伸，而不是平铺
+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
////以长度的一半，高度的一半为中心进行拉伸。


@end
