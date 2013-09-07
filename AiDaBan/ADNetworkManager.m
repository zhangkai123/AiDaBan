//
//  ADNetworkManager.m
//  AiDaBan
//
//  Created by zhang kai on 8/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADNetworkManager.h"
#import "ADSinaAPIClient.h"
#import "ADMyServerClient.h"

@implementation ADNetworkManager
+(id)sharedNetworkManager
{
    static ADNetworkManager *networkManagerController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        networkManagerController = [[ADNetworkManager alloc]init];
    });
    return networkManagerController;
}
-(id)init
{
    if (self = [super init]) {
    }
    return self;
}

-(void)sendSinaUserInfoRequest:(void (^)(id JSON))success failure:(void (^)(NSError *error))failure
{
    ADSinaAPIClient *client = [ADSinaAPIClient sharedClient];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userId = [userDefaults objectForKey:AD_SINA_USER_ID];
    NSString *accessToken = [userDefaults objectForKey:AD_SINA_ACCESS_TOKEN];
    
    NSString *path = @"users/show.json";
    NSDictionary *paraDic = [NSDictionary dictionaryWithObjectsAndKeys:userId,@"uid",accessToken,@"access_token", nil];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:path parameters:paraDic];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        success(JSON);
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
        failure(error);
    }];
    [operation start];
}
-(void)sendUserTokenToServerForLogin:(void (^)(id JSON))success failure:(void (^)(NSError *error))failure
{
    ADMyServerClient *client = [ADMyServerClient sharedClient];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *accessToken = [userDefaults objectForKey:AD_SINA_ACCESS_TOKEN];
    
    NSString *path = @"Login/ThirdPartyUserLogin";
    NSDictionary *paraDic = [NSDictionary dictionaryWithObjectsAndKeys:@"sina",@"user_category",accessToken,@"access_token", nil];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:path parameters:paraDic];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        success(JSON);
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
        failure(error);
    }];
    [operation start];
}
@end
