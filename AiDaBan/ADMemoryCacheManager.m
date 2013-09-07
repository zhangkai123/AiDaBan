//
//  ADMemoryCacheManager.m
//  AiDaBan
//
//  Created by zhang kai on 9/7/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADMemoryCacheManager.h"

@implementation ADMemoryCacheManager
+(id)sharedMemoryCacheManager
{
    static ADMemoryCacheManager *memoryCacheManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        memoryCacheManager = [[ADMemoryCacheManager alloc]init];
    });
    return memoryCacheManager;
}
-(id)init
{
    if (self = [super init]) {
    }
    return self;
}

@end
