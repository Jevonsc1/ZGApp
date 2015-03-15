//
//  ZGOrderController.m
//  ZGApp
//
//  Created by Jevons on 15/2/27.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGOrderController.h"
#import "ZGOrderView.h"


@implementation ZGOrderController
-(void)viewDidLoad
{
    [super viewDidLoad];
    NSArray  *apparray= [[NSBundle mainBundle]loadNibNamed:@"ZGOrderView" owner:nil options:nil];
    ZGOrderView *view=[apparray firstObject];
    view.order=self.order;
    view.frame=self.view.frame;
    [self.view addSubview:view];
    
    [self setupNav];
}

-(void)setupNav
{
    UIBarButtonItem* leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menubar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItem)];
    self.navigationItem.leftBarButtonItem=leftItem;
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    
    self.navigationItem.title=@"我的订单";
}

-(void)leftBarItem
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
