//
//  ViewController.m
//  AiDaBan
//
//  Created by zhang kai on 7/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ViewController.h"
#import "ADEditTopCell.h"

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
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    theTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, screenRect.size.height - 44 - 50 - 20)];
    theTableView.delegate = self;
    theTableView.dataSource = self;
    [self.view addSubview:theTableView];
    
    UIView *bottomBarView = [[UIView alloc]initWithFrame:CGRectMake(0, screenRect.size.height - 50 - 20, 320, 50)];
    bottomBarView.backgroundColor = [UIColor blueColor];
    
    UIButton *finshButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 106, 50)];
    [finshButton setTitle:@"完成" forState:UIControlStateNormal];
    [finshButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    finshButton.backgroundColor = [UIColor yellowColor];
    [finshButton addTarget:self action:@selector(finishEdit) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarView addSubview:finshButton];
    [finshButton release];
    
    UIButton *editButton = [[UIButton alloc]initWithFrame:CGRectMake(107, 0, 106, 50)];
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    [editButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    editButton.backgroundColor = [UIColor yellowColor];
    [editButton addTarget:self action:@selector(startEdit) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarView addSubview:editButton];
    [editButton release];

    UIButton *previewButton = [[UIButton alloc]initWithFrame:CGRectMake(214, 0, 106, 50)];
    [previewButton setTitle:@"预览" forState:UIControlStateNormal];
    [previewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    previewButton.backgroundColor = [UIColor yellowColor];
    [previewButton addTarget:self action:@selector(preView) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarView addSubview:previewButton];
    [previewButton release];
    
    [self.view addSubview:bottomBarView];
}
-(void)finishEdit
{
    
}
-(void)startEdit
{
    
}
-(void)preView
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"topCell"];
        if (!cell) {
            cell = [[[ADEditTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"topCell"]autorelease];
        }
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"topCell"];
        if (!cell) {
            cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"topCell"]autorelease];
        }
    }
    
    return cell;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height;
    if (indexPath.row == 0) {
        height = 100;
    }else{
        height = 120;
    }
    return height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
