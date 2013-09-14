//
//  InstagramViewController.m
//  RaisedCenterTabBar
//
//  Created by Peter Boctor on 12/15/10.
//
// Copyright (c) 2011 Peter Boctor
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE
//

#import "ADTabbarViewController.h"
#import "ADExploreViewController.h"
#import "ADEditViewController.h"
#import "ADMeViewController.h"

@implementation ADTabbarViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

    ADExploreViewController *exploreViewController = [[[ADExploreViewController alloc]init]autorelease];
    exploreViewController.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"浏览" image:[UIImage imageNamed:@"112-group.png"] tag:0] autorelease];
    
    ADMeViewController *meViewController = [[[ADMeViewController alloc]init]autorelease];
    meViewController.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"123-id-card.png"] tag:0] autorelease];
    
    self.viewControllers = [NSArray arrayWithObjects:
                            exploreViewController,
                            [self viewControllerWithTabTitle:@"编辑" image:nil],
                            meViewController, nil];
    
    [self addCenterButtonWithImage:[UIImage imageNamed:@"cameraTabBarItem.png"] highlightImage:nil];
    BOOL userLoginMask = [[ADDataController sharedDataController]getUserLoginMask];
    if (!userLoginMask) {
        [self addMeButton];
    }
    self.tabBar.barTintColor = UIColorFromRGB(0x5C5C5C);
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
}
// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, 320/3, buttonImage.size.height);
//    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
//    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    button.backgroundColor = UIColorFromRGB(0xC0003D);
    [button addTarget:self action:@selector(addContent) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [self.view addSubview:button];
}
-(void)addMeButton
{
    meLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    meLoginButton.frame = CGRectMake(320/3*2, self.tabBar.frame.origin.y, 320/3, self.tabBar.frame.size.height);
    [meLoginButton addTarget:self action:@selector(presentLoginView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:meLoginButton];
}
-(void)addContent
{
    BOOL userLoginMask = [[ADDataController sharedDataController]getUserLoginMask];
    if (userLoginMask) {
        ADEditViewController *viewController = [[ADEditViewController alloc]init];
        [self presentViewController:viewController animated:YES completion:nil];
        [viewController release];
    }else{
        [self presentLoginView];
    }
}
-(void)presentLoginView
{
    ADLoginViewController *loginViewController = [[ADLoginViewController alloc]init];
    loginViewController.delegate = self;
    [self presentViewController:loginViewController animated:YES completion:nil];
    [loginViewController release];
}

-(void)removeMeLoginButtonAfterLogin
{
    [meLoginButton removeFromSuperview];
}
@end
