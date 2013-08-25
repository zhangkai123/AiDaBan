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
    [sinaLoginButton setTitle:@"新浪微博登陆" forState:UIControlStateNormal];
    sinaLoginButton.backgroundColor = [UIColor redColor];
    [sinaLoginButton addTarget:self action:@selector(sinaWeiboLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sinaLoginButton];
    [sinaLoginButton release];
    
    UIButton *tecentLoginButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 220, 260, 34)];
    [tecentLoginButton setTitle:@"腾讯微博登陆" forState:UIControlStateNormal];
    tecentLoginButton.backgroundColor = [UIColor purpleColor];
    [tecentLoginButton addTarget:self action:@selector(tencentWeiboLogin) forControlEvents:UIControlEventTouchUpInside];
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
}
-(void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)sinaWeiboLogin
{
    
}
-(void)tencentWeiboLogin
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
