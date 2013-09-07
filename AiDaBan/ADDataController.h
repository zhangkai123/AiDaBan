//
//  ADLoginDataController.h
//  AiDaBan
//
//  Created by zhang kai on 8/27/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADUser.h"

@interface ADDataController : NSObject


+(id)sharedDataController;

-(BOOL)getUserLoginMask;
-(void)saveSinaLoginInfo:(WBBaseResponse *)response;
-(void)getSinaUserInfo:(void(^)(ADUser *sinaUser))sinaUserInfo failure:(void (^)(NSError *error))failure;
-(void)getMyUserToken:(void (^)(NSString *userToken))myUserToken failure:(void (^)(NSError *error))failure;
@end
