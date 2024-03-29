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
-(void)saveUserInfo:(ADUser *)user
{
    NSString *name = [user name];
    NSString *gender = [user gender];
    NSString *profile_image_url = [user profile_image_url];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:name,AD_USER_NAME,
                              gender,AD_USER_GENDER,
                              profile_image_url,AD_USER_IMAGE_URL, nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userInfo forKey:AD_USER_INFO];
    [userDefaults synchronize];
}
-(NSDictionary *)getUserInfoFromDisk
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userInfo = [userDefaults objectForKey:AD_USER_INFO];
    return userInfo;
}
-(void)saveUserLoginMask:(BOOL)logined
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:logined forKey:AD_USER_HAVE_LOGIN];
    [userDefaults synchronize];
}
-(BOOL)getUserLoginMask
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL loginMask = [userDefaults boolForKey:AD_USER_HAVE_LOGIN];
    return loginMask;
}
-(void)saveCurrentEditCourse:(NSDictionary *)dic
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:dic forKey:AD_CURRENT_EDIT_COURSE];
    [userDefaults synchronize];
}
-(NSDictionary *)getCurrentEditCourse
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *currentEditCourseDic = [userDefaults objectForKey:AD_CURRENT_EDIT_COURSE];
    return currentEditCourseDic;
}

@end
