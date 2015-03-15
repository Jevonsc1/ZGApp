//
//  ZGUserController.m
//  ZGApp
//
//  Created by T on 15/3/4.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGUserController.h"
#import "ZGUserHeaderView.h"
#import "ZGHeaderFrame.h"
#import "ZGUserFooterView.h"
#import "UIImage+ImageEffects.h"
#import "ZGUserNav.h"
@interface ZGUserController()<ZGUserNavDelegate>
@property(nonatomic,strong)ZGHeaderFrame* topF;
@property(nonatomic,strong)ZGUserFooterView* footerView;
@property(nonatomic,strong)ZGUserHeaderView* headerView;
@property(nonatomic,weak)UIImageView* imageview;
@property(nonatomic,strong)ZGUserNav* userNav;
@property(nonatomic,weak)UIImageView* barBG;
@end
@implementation ZGUserController
-(NSMutableArray *)bookArray
{
    if (_bookArray==nil) {
        _bookArray=[NSMutableArray array];
    }
    return  _bookArray;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
   
    
    [self setupUserAndTop];
    [self setupBookArray];
    [self setupNav];
    
    ZGUserHeaderView* headerView=[[ZGUserHeaderView alloc]init];
    headerView.topF=self.topF;
    headerView.backgroundColor=[UIColor clearColor];
    self.headerView=headerView;
    
    ZGUserFooterView* footerView=[[ZGUserFooterView alloc]init];
    footerView.bookArray=self.bookArray;
    self.footerView=footerView;
    
    [self.barBG setHidden:NO];
    [self.userNav setHidden:NO];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
}
-(void)setupNav
{
    UIImageView* barBG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 63)];
    barBG.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"memubar_book_background"]];
    [self.navigationController.view addSubview:barBG];
    self.barBG=barBG;
    
    ZGUserNav* bar=[[ZGUserNav alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 65)];
    bar.name=self.user.userName;
    bar.delegate=self;
    bar.backgroundColor=Blue;
    self.userNav=bar;
    [self.navigationController.view addSubview:bar];
    
    UIBarButtonItem* backItem=[[UIBarButtonItem alloc]init];
    backItem.tintColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=backItem;
}
-(void)setupBookArray
{
   
    for (int i=0; i<23; i++) {
        [self addBook];
    }
}
-(void)addBook{
    ZGBook* book=[[ZGBook alloc]init];
    book.title=@"ads";
    [self.bookArray addObject:book];
}
-(void)setupUserAndTop
{
    ZGUser* user=[[ZGUser alloc]init];
    user.iconImage=[UIImage imageNamed:@"YL"];
    user.userIntro=@"知更 Co-Founder";
    user.sex=1;
    user.rank=7;
    user.userName=@"郑泓硕";
    user.tags=[NSArray arrayWithObjects:@"设计",@"艺术",@"互联网", @"设计",@"艺术",@"互联网",nil];
    self.user=user;
    
    ZGHeaderFrame* topF=[[ZGHeaderFrame alloc]init];
    topF.user=user;
    self.topF=topF;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[[UITableViewCell alloc]init];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.headerView.viewHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return self.footerView.viewHeight;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    UIImage* image=[UIImage imageNamed:@"lobo"];
        image=[image applyBlurWithRadius:10.0 tintColor:nil saturationDeltaFactor:1 maskImage:nil];
    UIImageView* imageview=[[UIImageView alloc]initWithImage:image];
    imageview.frame=CGRectMake(0, 0, 320, 380);
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.headerView.frame.size.width, self.headerView.frame.size.height)];
    [view addSubview:imageview];
    self.tableView.backgroundView=view;
    self.imageview=imageview;
    
    return self.headerView;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
 
   return self.footerView;
}
-(void)navBarWithBtnBack:(ZGUserNav *)navBar{
    self.navigationController.navigationBar.layer.opacity=1;
    [self.barBG setHidden:YES];
    [self.userNav setHidden:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   self.navigationController.navigationBar.layer.opacity=0;
    self.imageview.layer.anchorPoint=CGPointMake(0.5, 0);
    self.imageview.layer.position=CGPointMake(self.tableView.frame.size.width*0.5, 0);
    self.userNav.backgroundColor=[UIColor colorWithRed:66/255.0 green:181/255.0 blue:247/255.0 alpha:scrollView.contentOffset.y/100];
    if(scrollView.contentOffset.y<-30)
    self.imageview.transform=CGAffineTransformMakeScale(1-(scrollView.contentOffset.y+30)/100, 1-(scrollView.contentOffset.y+30)/100);
}

@end
