//
//  ADDiskManager.m
//  AiDaBan
//
//  Created by zhang kai on 9/7/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADDiskCacheManager.h"

@implementation ADDiskCacheManager
+(id)sharedDiskCacheManager
{
    static ADDiskCacheManager *diskCacheManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        diskCacheManager = [[ADDiskCacheManager alloc]init];
    });
    return diskCacheManager;
}
-(id)init
{
    if (self = [super init]) {
    }
    return self;
}
-(void)saveSinaLoginInfo:(WBBaseResponse *)response
{
    NSString *sinaUserID = [(WBAuthorizeResponse *)response userID];
    NSString *sinaUserAccessToken = [(WBAuthorizeResponse *)response accessToken];
    NSDate *sinaUserExpirationDate = [(WBAuthorizeResponse *)response expirationDate];
    NSDictionary *sinaUserLoginInfo = [NSDictionary dictionaryWithObjectsAndKeys:sinaUserID,AD_SINA_USER_ID,
                                       sinaUserAccessToken,AD_SINA_ACCESS_TOKEN,
                                       sinaUserExpirationDate,AD_SINA_TOKEN_EXPIRATION_DATE,nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:sinaUserLoginInfo forKey:AD_SINA_USER_LOGIN_INFO];
    [userDefaults synchronize];
}
-(NSDictionary *)getSinaLoginInfo
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *sinaUserLoginInfo = [userDefaults objectForKey:AD_SINA_USER_LOGIN_INFO];
    return sinaUserLoginInfo;
}
@end
