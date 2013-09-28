//
//  ADAddTitleViewController.h
//  AiDaBan
//
//  Created by zhang kai on 9/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ADAddTitleViewControllerDelegate <NSObject>

-(void)saveCurrentCourse:(UIViewController *)content title:(NSString *)title;

@end

@interface ADAddTitleViewController : UIViewController
{
    id<ADAddTitleViewControllerDelegate> delegate;
}
@property(nonatomic,assign) id<ADAddTitleViewControllerDelegate> delegate;
@end
