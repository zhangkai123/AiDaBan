//
//  ADUser.m
//  AiDaBan
//
//  Created by zhang kai on 8/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADUser.h"

@implementation ADUser
@synthesize name = _name ,gender = _gender, profile_image_url = _profile_image_url;

-(id)initWithJsonData:(id)json
{
    if (self = [super init]) {
        
        self.name = [json objectForKey:@"name"];
        self.gender = [json objectForKey:@"gender"];
        self.profile_image_url = [json objectForKey:@"profile_image_url"];
    }
    return self;
}
-(id)initWithDictionaryData:(NSDictionary *)dic
{
    if (self = [super init]) {
        
        self.name = [dic objectForKey:AD_USER_NAME];
        self.gender = [dic objectForKey:AD_USER_GENDER];
        self.profile_image_url = [dic objectForKey:AD_USER_IMAGE_URL];
    }
    return self;
}
@end
