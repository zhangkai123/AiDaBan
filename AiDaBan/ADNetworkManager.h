//
//  ADNetworkManager.h
//  AiDaBan
//
//  Created by zhang kai on 8/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADNetworkManager : NSObject

+(id)sharedNetworkManager;
-(void)sendSinaUserInfoRequest:(void (^)(id JSON))success failure:(void (^)(NSError *error))failure;
-(void)sendUserTokenToServerForLogin:(void (^)(id JSON))success failure:(void (^)(NSError *error))failure;
@end
