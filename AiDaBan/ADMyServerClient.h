//
//  ADMyServerClient.h
//  AiDaBan
//
//  Created by zhang kai on 9/7/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "AFNetworking.h"

@interface ADMyServerClient : AFHTTPClient

+(ADMyServerClient *)sharedClient;
@end
