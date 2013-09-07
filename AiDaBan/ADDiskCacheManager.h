//
//  ADDiskManager.h
//  AiDaBan
//
//  Created by zhang kai on 9/7/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADDiskCacheManager : NSObject


+(id)sharedDiskCacheManager;
-(void)saveSinaLoginInfo:(WBBaseResponse *)response;
-(NSDictionary *)getSinaLoginInfo;
-(void)saveUserInfo:(ADUser *)user;
-(NSDictionary *)getUserInfoFromDisk;
-(void)saveUserLoginMask:(BOOL)logined;
-(BOOL)getUserLoginMask;
@end
