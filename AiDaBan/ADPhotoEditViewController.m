//
//  ADPhotoEditViewController.m
//  AiDaBan
//
//  Created by zhang kai on 9/27/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADPhotoEditViewController.h"
#import "ADAddTitleViewController.h"

@interface ADPhotoEditViewController ()<ADAddTitleViewControllerDelegate>
{
    UITextField *desciptField;
}
@end

@implementation ADPhotoEditViewController
@synthesize delegate ,myImage;

-(void)dealloc
{
    [myImage release];
    [desciptField release];
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
    
    desciptField = [[UITextField alloc]initWithFrame:CGRectMake(85, 44 + 10, 225, 110)];
    desciptField.backgroundColor = [UIColor redColor];
    [self.view addSubview:desciptField];

}
-(void)goBack
{
    [self.delegate disMissPhotoEditViewController:self];
}
-(void)finishEdit
{
    [self showAddTitleViewController];
//    [self.delegate finishPhotoEdit:self myPhoto:myImage description:desciptField.text];
}
-(void)savePhoto
{
    
}
#pragma mark - ADAddTitleViewControllerDelegate
-(void)saveCurrentCourse:(UIViewController *)content title:(NSString *)title
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    
    NSMutableDictionary *dictionary1 = [[NSMutableDictionary alloc]init];
    [dictionary1 setObject:title forKey:@"CourseTitle"];
    
    NSMutableArray *courseCardArray = [[NSMutableArray alloc]init];
    NSDictionary *courseCardDic = [NSDictionary dictionaryWithObjectsAndKeys:@"1.png",@"ImageName",desciptField.text,@"Description", nil];
    [courseCardArray addObject:courseCardDic];
    
    [dictionary1 setObject:courseCardArray forKey:@"CourseCard"];
    [courseCardArray release];
    
    [dictionary setObject:dictionary1 forKey:@"CurrentEditCourse"];
    [dictionary1 release];
    
    [[ADDataController sharedDataController]saveCurrentEditCourse:dictionary];
    [dictionary release];
    
    [content willMoveToParentViewController:nil];
    [UIView animateWithDuration:0.6 animations:^{
        content.view.frame = CGRectMake(0, content.view.frame.size.height, content.view.frame.size.width, content.view.frame.size.height);
    }completion:^(BOOL finished){
        [content.view removeFromSuperview];
        [content removeFromParentViewController];
        [self.delegate disMissPhotoEditViewController:self];
    }];
}

#pragma mark - for child controller
-(void)showAddTitleViewController
{
    ADAddTitleViewController *addTitleViewController = [[ADAddTitleViewController alloc]init];
    addTitleViewController.delegate = self;
    [self displayContentController:addTitleViewController];
    [addTitleViewController release];
}
- (void) displayContentController: (UIViewController*) content;
{
    [self addChildViewController:content];
    content.view.frame = self.view.frame;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
