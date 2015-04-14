//
//  User.h
//  TianAnRenShou
//
//  Created by han on 15/4/14.
//  Copyright (c) 2015年 韩赵凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
@interface User : NSObject
@property (nonatomic, strong) NSNumber * userID;
@property (nonatomic, copy) NSString * userSignin;
@property (nonatomic, copy) NSString * userBarthday;
@property (nonatomic, copy) NSString * userNumber;
@property (nonatomic, copy) NSString * userType;
@property (nonatomic, copy) NSString * userSex;
@property (nonatomic, copy) NSString * userName;
@property (nonatomic, copy) NSString * userIconName;
@property (nonatomic, copy) NSString * userAddress;
@property (nonatomic, copy) NSString * userCode;


singleton_h(User)


@end
