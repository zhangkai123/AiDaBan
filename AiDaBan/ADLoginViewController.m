//
//  ADLoginViewController.m
//  AiDaBan
//
//  Created by zhang kai on 8/25/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADLoginViewController.h"

@interface ADLoginViewController ()

@end

@implementation ADLoginViewController
@synthesize delegate;

-(void)dealloc
{
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 45, 34)];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    backButton.backgroundColor = [UIColor blueColor];
    
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    [backButton release];

    UIButton *sinaLoginButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 170, 260, 34)];
    [sinaLoginButton setTitle:@"QQ登陆" forState:UIControlStateNormal];
    sinaLoginButton.backgroundColor = [UIColor redColor];
    [sinaLoginButton addTarget:self action:@selector(qqLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sinaLoginButton];
    [sinaLoginButton release];
    
    UIButton *tecentLoginButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 220, 260, 34)];
    [tecentLoginButton setTitle:@"新浪微博登陆" forState:UIControlStateNormal];
    tecentLoginButton.backgroundColor = [UIColor purpleColor];
    [tecentLoginButton addTarget:self action:@selector(sinaWeiboLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tecentLoginButton];
    [tecentLoginButton release];

    UIButton *registerButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 270, 260, 34)];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    registerButton.backgroundColor = [UIColor blueColor];
    [registerButton addTarget:self action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    [registerButton release];

    UIButton *loginButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 320, 260, 34)];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor greenColor];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    [loginButton release];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sinaWeiboHaveGetToken) name:AD_SINA_GET_TOKEN_SUCCESS object:nil];
}

#pragma sina weibo login
-(void)sinaWeiboLogin
{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = AD_SINA_kRedirectURI;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"ADLoginViewController"};
    [WeiboSDK sendRequest:request];
}
-(void)sinaWeiboHaveGetToken
{
    [[ADDataController sharedDataController]getMyUserToken:^(NSString *userToken){
        
        [self getSinaUserInformation];
    }failure:^(NSError *error){
        
    }];
}
-(void)getSinaUserInformation
{
    [[ADDataController sharedDataController]getSinaUserInfo:^(ADUser *sinaUser){
        
        [self.delegate removeMeLoginButtonAfterLogin];
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(NSError *error){
        
    }];
}


-(void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)qqLogin
{
    
}
-(void)registerUser
{
    
}
-(void)login
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
