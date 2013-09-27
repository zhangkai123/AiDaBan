//
//  ViewController.m
//  AiDaBan
//
//  Created by zhang kai on 7/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADEditViewController.h"
#import "ADEditTopCell.h"
#import "ADPhotoEditViewController.h"

@interface ADEditViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,ADPhotoEditViewControllerDelegate>
{
    UILabel *topicLabel;
    UIImageView *topicImageView;
    UILabel *dateLabel;
    
    UITableView *theTableView;
    
    ADUser *user;
}
@end

@implementation ADEditViewController

-(void)dealloc
{
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor clearColor];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    topBarView.backgroundColor = UIColorFromRGB(0xC0003D);
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 39, 34)];
    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//    backButton.backgroundColor = UIColorFromRGB(0xD7D7D7);
    
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [topBarView addSubview:backButton];
    [backButton release];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 280, 44)];
    titleLabel.text = @"教程编辑";
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [topBarView addSubview:titleLabel];
    [titleLabel release];
    [self.view addSubview:topBarView];
    [topBarView release];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    theTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, screenRect.size.height - 44 - 50)];
    theTableView.delegate = self;
    theTableView.dataSource = self;
    [self.view addSubview:theTableView];
    
    UIView *bottomBarView = [[UIView alloc]initWithFrame:CGRectMake(0, screenRect.size.height - 50, 320, 50)];
    bottomBarView.backgroundColor = [UIColor whiteColor];
    
    UIButton *finshButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 106, 50)];
    [finshButton setTitle:@"完成" forState:UIControlStateNormal];
    [finshButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    finshButton.backgroundColor = UIColorFromRGB(0x5C5C5C);
    [finshButton addTarget:self action:@selector(finishEdit) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarView addSubview:finshButton];
    [finshButton release];
    
    UIButton *editButton = [[UIButton alloc]initWithFrame:CGRectMake(106, 0, 108, 50)];
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    [editButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    editButton.backgroundColor = UIColorFromRGB(0xC0003D);
    [editButton addTarget:self action:@selector(startEdit) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarView addSubview:editButton];
    [editButton release];

    UIButton *previewButton = [[UIButton alloc]initWithFrame:CGRectMake(214, 0, 106, 50)];
    [previewButton setTitle:@"预览" forState:UIControlStateNormal];
    [previewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    previewButton.backgroundColor = UIColorFromRGB(0x5C5C5C);
    [previewButton addTarget:self action:@selector(preView) forControlEvents:UIControlEventTouchUpInside];
    [bottomBarView addSubview:previewButton];
    [previewButton release];
    
    [self.view addSubview:bottomBarView];
    
    user = [[ADDataController sharedDataController]getUserInfo];
}
-(void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)finishEdit
{
    
}
-(void)startEdit
{
    UIActionSheet *ac=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles:@"Photo Library",@"Camera Capture", nil];
    ac.delegate = self;
    [ac showInView:self.view];
    [ac release];
}
-(void)preView
{
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }else if(buttonIndex == 1){
        [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
    }
}
- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = sourceType;
    imagePickerController.delegate = self;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
    [imagePickerController release];
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
        [cell.imageView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:nil];
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

#pragma mark - UIImagePickerControllerDelegate

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [self showPhotoEditViewController:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ADPhotoEditViewControllerDelegate
-(void)disMissPhotoEditViewController: (UIViewController*) content
{
    [content willMoveToParentViewController:nil];
    [UIView animateWithDuration:0.6 animations:^{
        content.view.frame = CGRectMake(0, content.view.frame.size.height, content.view.frame.size.width, content.view.frame.size.height);
    }completion:^(BOOL finished){
        [content.view removeFromSuperview];
        [content removeFromParentViewController];
    }];
}
#pragma mark - for child controller
-(void)showPhotoEditViewController:(UIImage *)photo
{
    ADPhotoEditViewController *photoEditViewController = [[ADPhotoEditViewController alloc]init];
    photoEditViewController.delegate = self;
    photoEditViewController.myImage = photo;
    [self displayContentController:photoEditViewController];
    [photoEditViewController release];
}
- (void) displayContentController: (UIViewController*) content;
{
    [self addChildViewController:content];
    content.view.frame = self.view.frame;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

@end
