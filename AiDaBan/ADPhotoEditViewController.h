//
//  ADPhotoEditViewController.h
//  AiDaBan
//
//  Created by zhang kai on 9/27/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ADPhotoEditViewControllerDelegate <NSObject>

-(void)disMissPhotoEditViewController: (UIViewController*) content;
-(void)finishPhotoEdit:(UIViewController*) content myPhoto:(UIImage *)myPhoto description:(NSString *)des;

@end

@interface ADPhotoEditViewController : UIViewController
{
    id<ADPhotoEditViewControllerDelegate> delegate;
    UIImage *myImage;
}

@property(nonatomic,assign) id<ADPhotoEditViewControllerDelegate> delegate;
@property(nonatomic,retain) UIImage *myImage;
@end
