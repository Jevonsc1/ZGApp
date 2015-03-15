//
//  TBNavigationController.m
//  TestBooking
//
//  Created by Jevons on 14/12/13.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "TBNavigationController.h"
#import "BorrowViewController.h"

@interface TBNavigationController ()

@end

@implementation TBNavigationController

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
}

+(void)initialize
{
    
    [self setupNavButton];
    [self setupNavBar];
}

+(void)setupNavBar
{
    UINavigationBar* navbar=[UINavigationBar appearance];
  
//    navbar.backgroundColor=JWColor(66, 181, 247);
    NSMutableDictionary* attr=[NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName]=[UIColor whiteColor];
    [navbar setTitleTextAttributes:attr];
}

+(void)setupNavButton
{
    UIBarButtonItem* item=[UIBarButtonItem appearance];

    NSMutableDictionary* attr=[NSMutableDictionary dictionary];
    attr[NSFontAttributeName]=[UIFont systemFontOfSize:17];
    attr[NSForegroundColorAttributeName]=[UIColor whiteColor];
    attr[NSUnderlineColorAttributeName]=[UIColor whiteColor];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.userInteractionEnabled=YES;
    self.navigationBar.translucent=NO;
      self.navigationBar.barTintColor=JWColor(66, 181, 247);
}





@end
