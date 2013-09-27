//
//  ADPhotoEditViewController.m
//  AiDaBan
//
//  Created by zhang kai on 9/27/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADPhotoEditViewController.h"

@interface ADPhotoEditViewController ()

@end

@implementation ADPhotoEditViewController
@synthesize delegate ,myImage;

-(void)dealloc
{
    [myImage release];
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
    // Initialization code
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    topBarView.backgroundColor = UIColorFromRGB(0xC0003D);
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 45, 34)];
    //        [backButton setTitle:@"back" forState:UIControlStateNormal];
    //        backButton.backgroundColor = [UIColor blueColor];
    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [topBarView addSubview:backButton];
    [backButton release];
    
    UIButton *finishButton = [[UIButton alloc]initWithFrame:CGRectMake(320 - 45 - 5, 5, 45, 34)];
    [finishButton setTitle:@"finish" forState:UIControlStateNormal];
    finishButton.backgroundColor = UIColorFromRGB(0x5C5C5C);
    [finishButton addTarget:self action:@selector(finishEdit) forControlEvents:UIControlEventTouchUpInside];
    [topBarView addSubview:finishButton];
    [finishButton release];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 280, 44)];
    titleLabel.text = @"照片编辑";
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [topBarView addSubview:titleLabel];
    [titleLabel release];
    [self.view addSubview:topBarView];
    [topBarView release];
    
    UIImageView *photoView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 44 + 12, 60, 60)];
    photoView.backgroundColor = [UIColor yellowColor];
    photoView.image = self.myImage;
    [self.view addSubview:photoView];
    [photoView release];
    
    UITextField *desciptField = [[UITextField alloc]initWithFrame:CGRectMake(85, 44 + 10, 225, 110)];
    desciptField.backgroundColor = [UIColor redColor];
    [self.view addSubview:desciptField];
    [desciptField release];

}
-(void)goBack
{
    [self.delegate disMissPhotoEditViewController:self];
}
-(void)finishEdit
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
