//
//  ADAddTitleViewController.m
//  AiDaBan
//
//  Created by zhang kai on 9/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADAddTitleViewController.h"

@interface ADAddTitleViewController ()
{
    UITextField *titleField;
}
@end

@implementation ADAddTitleViewController
@synthesize delegate;
-(void)dealloc
{
    [titleField release];
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
    UIView *backgroundView = [[UIView alloc]initWithFrame:self.view.frame];
    backgroundView.backgroundColor = [UIColor blackColor];
    [backgroundView setAlpha:0.2];
    [self.view addSubview:backgroundView];
    [backgroundView release];
    
    UIView *coverView = [[UIView alloc]initWithFrame:CGRectMake(10, 80, 300, 320)];
    coverView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:coverView];
    [coverView release];
    
    UILabel *topLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 150, 20)];
    topLable.backgroundColor = [UIColor blueColor];
    topLable.text = @"课程设置";
    [coverView addSubview:topLable];
    [topLable release];
    
    titleField = [[UITextField alloc]initWithFrame:CGRectMake(5, 40, 290, 30)];
    titleField.backgroundColor = [UIColor redColor];
    [coverView addSubview:titleField];
    
    UIButton *cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 90, 140, 50)];
    cancelButton.backgroundColor = [UIColor grayColor];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelAddCourse) forControlEvents:UIControlEventTouchUpInside];
    [coverView addSubview:cancelButton];
    [cancelButton release];
    
    UIButton *okButton = [[UIButton alloc]initWithFrame:CGRectMake(170, 90, 140, 50)];
    okButton.backgroundColor = [UIColor grayColor];
    [okButton setTitle:@"确定" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(addCourse) forControlEvents:UIControlEventTouchUpInside];
    [coverView addSubview:okButton];
    [okButton release];
}
-(void)cancelAddCourse
{
    
}
-(void)addCourse
{
    [self.delegate saveCurrentCourse:self title:titleField.text];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
