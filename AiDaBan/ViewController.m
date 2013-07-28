//
//  ViewController.m
//  AiDaBan
//
//  Created by zhang kai on 7/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *topicLabel;
    UIImageView *topicImageView;
    UILabel *dateLabel;
    
    UITableView *theTableView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    topBarView.backgroundColor = [UIColor yellowColor];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 280, 44)];
    titleLabel.text = @"教程编辑";
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [topBarView addSubview:titleLabel];
    [titleLabel release];
    [self.view addSubview:topBarView];
    [topBarView release];
    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 54, 80, 80)];
//    imageView.image = [UIImage imageNamed:@"laopo.jpg"];
//    [self.view addSubview:imageView];
//    [imageView release];
//    
//    topicLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 200, 40)];
//    topicLabel.backgroundColor = [UIColor blueColor];
//    topicLabel.text = @"教程名";
//    [self.view addSubview:topicLabel];
//    
//    dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 110, 200, 20)];
//    dateLabel.backgroundColor = [UIColor yellowColor];
//    dateLabel.text = @"2013.07.27";
//    [self.view addSubview:dateLabel];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    theTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, screenRect.size.height - 44 - 50 - 20)];
    theTableView.delegate = self;
    theTableView.dataSource = self;
    [self.view addSubview:theTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"]autorelease];
    }
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
