//
//  ADLoginDataController.m
//  AiDaBan
//
//  Created by zhang kai on 8/27/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADLoginDataController.h"
#import "ADSinaAPIClient.h"

@implementation ADLoginDataController
+(id)sharedDataController
{
    static ADLoginDataController *loginDataController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        loginDataController = [[ADLoginDataController alloc]init];
    });
    return loginDataController;
}
-(id)init
{
    if (self = [super init]) {
    }
    return self;
}
-(void)getSinaUserInfo
{
    ADSinaAPIClient *client = [ADSinaAPIClient sharedClient];
//    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
//    [[AFNetworkActivityIndicatorManager sharedManager] incrementActivityCount];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userId = [userDefaults objectForKey:AD_USER_ID];
    NSString *accessToken = [userDefaults objectForKey:AD_ACCESS_TOKEN];
    
    NSString *path = @"users/show.json";
    NSDictionary *paraDic = [NSDictionary dictionaryWithObjectsAndKeys:userId,@"uid",accessToken,@"access_token", nil];
    NSURLRequest *request = [client requestWithMethod:@"GET" path:path parameters:paraDic];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//        [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
        NSLog(@"---");
        
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
//        [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
        NSLog(@"---");

    }];
    [operation start];
}
@end
