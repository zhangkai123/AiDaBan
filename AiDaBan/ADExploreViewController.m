//
//  ADExploreViewController.m
//  AiDaBan
//
//  Created by zhang kai on 8/25/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADExploreViewController.h"

@interface ADExploreViewController ()

@end

@implementation ADExploreViewController

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
//    self.view.backgroundColor = [UIColor blueColor];
    
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    topBarView.backgroundColor = UIColorFromRGB(0xC0003D);
    
    UIButton* hotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    hotButton.frame = CGRectMake(0.0, 0.0, 320/2, 44);
    hotButton.backgroundColor = UIColorFromRGB(0xC0003D);
    [hotButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [hotButton setTitle:@"最热" forState:UIControlStateNormal];
    [hotButton addTarget:self action:@selector(addContent) forControlEvents:UIControlEventTouchUpInside];

    UIButton* liveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    liveButton.frame = CGRectMake(320/2, 0.0, 320/2, 44);
    liveButton.backgroundColor = UIColorFromRGB(0xC0003D);
    [liveButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [liveButton setTitle:@"最新" forState:UIControlStateNormal];
    [liveButton addTarget:self action:@selector(addContent) forControlEvents:UIControlEventTouchUpInside];

    [topBarView addSubview:hotButton];
    [topBarView addSubview:liveButton];
    
    [self.view addSubview:topBarView];
    [topBarView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
