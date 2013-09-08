//
//  ADLoginViewController.h
//  AiDaBan
//
//  Created by zhang kai on 8/25/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ADLoginViewControllerDelegate <NSObject>

-(void)removeMeLoginButtonAfterLogin;

@end

@interface ADLoginViewController : UIViewController
{
    id<ADLoginViewControllerDelegate> delegate;
}
@property(nonatomic,assign) id<ADLoginViewControllerDelegate> delegate;
@end
