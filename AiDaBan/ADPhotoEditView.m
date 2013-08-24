//
//  ADPhotoEditView.m
//  AiDaBan
//
//  Created by zhang kai on 8/24/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADPhotoEditView.h"

@implementation ADPhotoEditView
@synthesize photoView;

-(void)dealloc
{
    [photoView release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
        
        UIView *topBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
        topBarView.backgroundColor = [UIColor yellowColor];
        
        UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 45, 34)];
        [backButton setTitle:@"back" forState:UIControlStateNormal];
        backButton.backgroundColor = [UIColor blueColor];
        [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        [topBarView addSubview:backButton];
        [backButton release];
        
        UIButton *finishButton = [[UIButton alloc]initWithFrame:CGRectMake(320 - 45 - 5, 5, 45, 34)];
        [finishButton setTitle:@"finish" forState:UIControlStateNormal];
        finishButton.backgroundColor = [UIColor blueColor];
        [finishButton addTarget:self action:@selector(finishEdit) forControlEvents:UIControlEventTouchUpInside];
        [topBarView addSubview:finishButton];
        [finishButton release];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 280, 44)];
        titleLabel.text = @"照片编辑";
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [topBarView addSubview:titleLabel];
        [titleLabel release];
        [self addSubview:topBarView];
        [topBarView release];

        photoView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 44 + 10, 80, 80)];
        photoView.backgroundColor = [UIColor yellowColor];
        [self addSubview:photoView];
        
        UITextField *desciptField = [[UITextField alloc]initWithFrame:CGRectMake(100, 44 + 10, 210, 210)];
        desciptField.backgroundColor = [UIColor redColor];
        [self addSubview:desciptField];
        [desciptField release];
    }
    return self;
}
-(void)goBack
{
    photoView.image = nil;
    self.hidden = YES;
}
-(void)finishEdit
{
    photoView.image = nil;
    self.hidden = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
