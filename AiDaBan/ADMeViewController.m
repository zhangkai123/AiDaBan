//
//  ADMeViewController.m
//  AiDaBan
//
//  Created by zhang kai on 8/25/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADMeViewController.h"
#import "ADLoginViewController.h"

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
    
    ADLoginViewController *loginViewController = [[ADLoginViewController alloc]init];
    [self presentViewController:loginViewController animated:YES completion:nil];
    [loginViewController release];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
