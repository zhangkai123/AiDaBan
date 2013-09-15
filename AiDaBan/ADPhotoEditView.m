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
        self.backgroundColor = [UIColor whiteColor];
        
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
        [self addSubview:topBarView];
        [topBarView release];

        photoView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 44 + 12, 60, 60)];
        photoView.backgroundColor = [UIColor yellowColor];
        [self addSubview:photoView];
        
        UITextField *desciptField = [[UITextField alloc]initWithFrame:CGRectMake(85, 44 + 10, 225, 110)];
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
