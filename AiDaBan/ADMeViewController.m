//
//  ADMeViewController.m
//  AiDaBan
//
//  Created by zhang kai on 8/25/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADMeViewController.h"

@interface ADMeViewController ()

@end

@implementation ADMeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    ADUser *user = [[ADDataController sharedDataController]getUserInfo];
    
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    topBarView.backgroundColor = UIColorFromRGB(0xC0003D);
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 280, 44)];
    titleLabel.text = @"我的";
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [topBarView addSubview:titleLabel];
    [titleLabel release];
    
    UIButton *setupButton = [[UIButton alloc]initWithFrame:CGRectMake(320 - 50, 5, 45, 34)];
    [setupButton setTitle:@"Set" forState:UIControlStateNormal];
    setupButton.backgroundColor = [UIColor blueColor];
    
    [setupButton addTarget:self action:@selector(setUp) forControlEvents:UIControlEventTouchUpInside];
    [topBarView addSubview:setupButton];
    [setupButton release];

    [self.view addSubview:topBarView];
    [topBarView release];

    UIView *profileView = [[UIView alloc]initWithFrame:CGRectMake(0, 44, 320, 68)];
    profileView.backgroundColor = [UIColor blackColor];
    
    UIImageView *profileImageView = [[UIImageView alloc]initWithFrame:CGRectMake(7, 7, 52, 52)];
    [profileImageView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:nil];
    [profileView addSubview:profileImageView];
    [profileImageView release];
    
    UILabel *profileNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(52 + 7 + 8, 8, 110, 23)];
    profileNameLabel.backgroundColor = [UIColor clearColor];
    [profileNameLabel setTextColor:[UIColor whiteColor]];
    profileNameLabel.text = user.name;
    [profileView addSubview:profileNameLabel];
    [profileNameLabel release];
    
    UILabel *locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(52 + 7 + 8, 8 + 23, 115, 17)];
    locationLabel.backgroundColor = [UIColor clearColor];
    [locationLabel setTextColor:[UIColor whiteColor]];
    locationLabel.text = @"中国";
    [profileView addSubview:locationLabel];
    [locationLabel release];
    
    [self.view addSubview:profileView];
    [profileView release];
    
    
}
-(void)setUp
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
