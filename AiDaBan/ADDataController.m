//
//  ADLoginDataController.m
//  AiDaBan
//
//  Created by zhang kai on 8/27/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADDataController.h"
#import "ADNetworkManager.h"
#import "ADDiskCacheManager.h"

@implementation ADDataController
+(id)sharedDataController
{
    static ADDataController *dataController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        dataController = [[ADDataController alloc]init];
    });
    return dataController;
}
-(id)init
{
    if (self = [super init]) {
    }
    return self;
}
-(void)saveSinaLoginInfo:(WBBaseResponse *)response
{
    [[ADDiskCacheManager sharedDiskCacheManager]saveSinaLoginInfo:response];
}
-(BOOL)getUserLoginMask
{
    return [[ADDiskCacheManager sharedDiskCacheManager]getUserLoginMask];
}



-(void)getMyUserToken:(void (^)(NSString *userToken))myUserToken failure:(void (^)(NSError *error))failure
{
    NSDictionary *sinaLoginInfo = [[ADDiskCacheManager sharedDiskCacheManager]getSinaLoginInfo];
    NSString *sinaUserAccessToken = [sinaLoginInfo objectForKey:AD_SINA_ACCESS_TOKEN];
    [[ADNetworkManager sharedNetworkManager]sendUserTokenToServerForLogin:sinaUserAccessToken success:^(id JSON){
        
        NSString *success = [JSON objectForKey:@"status"];
        if ([success isEqualToString:@"success"]) {
            NSString *myAccessToken = [JSON objectForKey:@"myAccessToken"];
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:myAccessToken forKey:AD_MY_ACCESS_TOKEN];
            [userDefaults synchronize];
            myUserToken(myAccessToken);
        }
    }failure:^(NSError *error){
        
    }];
}
-(void)getSinaUserInfo:(void(^)(ADUser *sinaUser))sinaUserInfo failure:(void (^)(NSError *error))failure
{
    NSDictionary *sinaLoginInfo = [[ADDiskCacheManager sharedDiskCacheManager]getSinaLoginInfo];
    [[ADNetworkManager sharedNetworkManager] sendSinaUserInfoRequest:sinaLoginInfo success:^(id JSON){
        
        ADUser *userInfo = [[ADUser alloc]initWithJsonData:JSON];
        [[ADDiskCacheManager sharedDiskCacheManager]saveUserInfo:userInfo];
        sinaUserInfo(userInfo);
        [userInfo release];
        [[ADDiskCacheManager sharedDiskCacheManager]saveUserLoginMask:YES];
    } failure:^(NSError *error){
        failure(error);
    }];
}
@end
