//
//  ADLoginDataController.m
//  AiDaBan
//
//  Created by zhang kai on 8/27/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADDataController.h"
#import "ADNetworkManager.h"

@implementation ADDataController
+(id)sharedDataController
{
    static ADDataController *loginDataController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        loginDataController = [[ADDataController alloc]init];
    });
    return loginDataController;
}
-(id)init
{
    if (self = [super init]) {
    }
    return self;
}
-(void)getSinaUserInfo:(void(^)(ADUser *sinaUser))sinaUserInfo failure:(void (^)(NSError *error))failure
{
    [[ADNetworkManager sharedNetworkManager]sendSinaUserInfoRequest:^(id JSON){
        ADUser *userInfo = [[ADUser alloc]initWithJsonData:JSON];
        sinaUserInfo(userInfo);
        [userInfo release];
    } failure:^(NSError *error){
        failure(error);
    }];
}
-(void)saveUserInfoToServer:(ADUser *)userInfo
{
    
}
@end
