//
//  TBTabBarController.m
//  TestBooking
//
//  Created by Jevons on 14/12/13.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//


/**
 *  在plist文件注明view－base的bool为no，才可以使status的颜色改变
 */

#import "TBTabBarController.h"
#import "TBTarBar.h"
#import "BorrowViewController.h"
#import "TBNavigationController.h"
#import "DiscoverController.h"
#import "ContactViewController.h"
#import "MySelfController.h"

#import "ZGUserController.h"

@interface TBTabBarController()<TBTarBarDelegate>
@property(nonatomic,weak)TBTarBar* tabbar;
@end

@implementation TBTabBarController
-(void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    TBTarBar* tabbar=[[TBTarBar alloc]init];
    [tabbar setBackgroundColor:JWColor(254, 254, 254)];
    tabbar.frame=self.tabBar.bounds;
    tabbar.delegate=self;
    [self.tabBar addSubview:tabbar];
    self.tabbar=tabbar;
    [self setSub];
    

//    NSLog(@"%d",self.childViewControllers.count);
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView* view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }
}

-(void)setSub
{
    BorrowViewController* vc=[[BorrowViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self con:vc img:@"tabbar_jieyue_normal" selected:@"tabbar_jieyue_selected" title:@"借阅"];
    
    ContactViewController* vc1=[[ContactViewController alloc]init];
    [self con:vc1 img:@"tabbar_naonow_normal" selected:@"tabbar_naonow_selected" title:@"联系人"];
    
//    ZGUserController* vc2=[[ZGUserController alloc]init];
//    [self con:vc2 img:@"tabbar_shuping_normal" selected:@"tabbar_shuping_selected" title:@"发现"];
    
    MySelfController* vc3=[[MySelfController alloc]init];
    [self con:vc3 img:@"tabbar_me_normal" selected:@"tabbar_me_selected" title:@"个人"];
}

// 创建一个控制器，成为本控制器的子控制器，将控制器的uibaritem传入tabbar的属性中，

-(void)con:(UIViewController*)con img:(NSString*)img selected:(NSString*)selected title:(NSString*)title
{
    TBNavigationController* nav=[[TBNavigationController alloc]initWithRootViewController:con];
    [self addChildViewController:nav];

    con.tabBarItem.image=[UIImage imageNamed:img];
    con.tabBarItem.selectedImage=[UIImage imageNamed:selected];
    con.title=title;
   
    [self.tabbar addItem:con.tabBarItem];
}
-(void)tabBar:(TBTarBar *)tabBar  to:(int)to
{
    self.selectedIndex=to;
    
}

@end
