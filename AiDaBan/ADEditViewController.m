//
//  ViewController.m
//  AiDaBan
//
//  Created by zhang kai on 7/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADEditViewController.h"
#import "ADEditTopCell.h"
#import "ADPhotoEditView.h"

@interface ADEditViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UILabel *topicLabel;
    UIImageView *topicImageView;
    UILabel *dateLabel;
    
    UITableView *theTableView;
    
    ADPhotoEditView *photoEditView;
    
    ADUser *user;
}
@end

@implementation ADEditViewController

-(void)dealloc
{
    [photoEditView release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    topBarView.backgroundColor = [UIColor yellowColor];
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 45, 34)];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    backButton.backgroundColor = [UIColor blueColor];
    
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [topBarView addSubview:backButton];
    [backButton release];
    
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
    theTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, screenRect.size.height - 44 - 50)];
    theTableView.delegate = self;
    theTableView.dataSource = self;
    [self.view addSubview:theTableView];
    
    UIView *bottomBarView = [[UIView alloc]initWithFrame:CGRectMake(0, screenRect.size.height - 50, 320, 50)];
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
    
    photoEditView = [[ADPhotoEditView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self.view addSubview:photoEditView];
    photoEditView.hidden = YES;
    
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
    
    photoEditView.hidden = NO;
    photoEditView.photoView.image = image;
    
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

@end
