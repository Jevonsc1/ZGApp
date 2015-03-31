//
//  ZGBookDetailController.m
//  ZGApp
//
//  Created by Jevons on 15/1/26.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBookDetailController.h"
#import "ZGBook.h"
#import "ZGBookDetailView.h"
#import "ZGBookDetailBtnView.h"
#import "ZGNavigationBackView.h"
#import "UIImageView+WebCache.h"
#import "UIImage+ImageEffects.h"
#import "BookDetailBottomView.h"
#import "UIImageView+WebCache.h"
#import "ZGBookDetailComCell.h"

#import "ZGBookNav.h"
#import "ZGBookComment.h"

@interface ZGBookDetailController ()<ZGBookNavDelegate>
@property(nonatomic,weak)ZGBookDetailBtnView* btnView;
@property(nonatomic,weak)ZGBookDetailTopView* topView;
@property(nonatomic,weak)UIImageView* imageview;
@property(nonatomic,strong)ZGBookNav* bookNav;
@property(nonatomic,weak)UIImageView* barBG;
@end

@implementation ZGBookDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.layer.opacity=0;
   
    UIImageView* imageview=[[UIImageView alloc]init];
    [imageview setImageWithURL:[NSURL URLWithString:self.TopDetailFrame.book.images.medium] placeholderImage:nil];
    imageview.image=[imageview.image applyBlurWithRadius:20.0 tintColor:nil saturationDeltaFactor:1 maskImage:nil];
    imageview.frame=CGRectMake(0, 0, 320, 380);
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.TopDetailFrame.topViewF.size.width, self.TopDetailFrame.topViewF.size.height)];
    [view addSubview:imageview];
    self.tableView.backgroundView=view;
    self.imageview=imageview;

    
    [self setupNav];
    
    UINib * nib = [UINib nibWithNibName:@"ZGBookDetailComCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"Jevons"];
    
}

//-(void)navBarWithBtnBack:(ZGBookNav *)navBar
//{
//    
//    [self.navigationController popViewControllerAnimated:YES];
//    
//}
-(void)navBarWithBtnCol:(ZGBookNav *)navBar
{
    
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
    
    
    ZGBookNav* bar=[[ZGBookNav alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,65)];
    bar.name=@"书籍详情";
    bar.delegate=self;
    bar.backgroundColor=Blue;
    self.bookNav=bar;
    
    [self.navigationController.view addSubview:bar];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}



#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        return 0;
    }
    else {
      return 6;
    }
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        ZGBookDetailTopView* topView=[[ZGBookDetailTopView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.TopDetailFrame.topViewHeight)];
        topView.Detailframe=self.TopDetailFrame;
        topView.backgroundColor=[UIColor clearColor];
        return topView;
    }else{
        ZGBookDetailBtnView* btnView=[[ZGBookDetailBtnView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
        self.btnView=btnView;
        btnView.book=self.TopDetailFrame.book;
        return btnView;
    }
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0&&indexPath.section==1) {
        BookDetailBottomView* bottomView=[[BookDetailBottomView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.TopDetailFrame.bottomViewHeigth)];
        bottomView.DetailFrame=self.TopDetailFrame;
        return bottomView;
    }
    else{
    ZGBookDetailComCell* cell=[ZGBookDetailComCell initWithTableView:tableView];
        ZGBookComment* comment=[[ZGBookComment alloc]init];
        cell.comment=comment;
     return cell;
    }
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return self.TopDetailFrame.topViewF.size.height;
    }
    else{
        return 60;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0&&indexPath.section==0) {
        return 0.1f;
    }
    else if (indexPath.row==0&&indexPath.section==1){
        
        return self.TopDetailFrame.bottomViewHeigth;
        
    }
    else
    {
        return 135.0f;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.navigationController.navigationBar.layer.opacity=0;
    self.bookNav.backgroundColor=[UIColor colorWithRed:66/255.0 green:181/255.0 blue:247/255.0 alpha:scrollView.contentOffset.y/100];
    self.imageview.layer.anchorPoint=CGPointMake(0.5, 0);
    self.imageview.layer.position=CGPointMake(self.tableView.frame.size.width*0.5, 0);
    
    if(scrollView.contentOffset.y<-20){
        self.imageview.transform=CGAffineTransformMakeScale(1-(scrollView.contentOffset.y+20)/100, 1-(scrollView.contentOffset.y+20)/100);
    }

    if (scrollView.contentOffset.y>20) {
        self.bookNav.name=self.TopDetailFrame.book.title;
    }
    else{
        self.bookNav.name=@"书籍详情";
    }
    
}
-(void)navBarWithBtnBack:(ZGBookNav *)navBar
{
    [self.barBG setHidden:YES];
    [self.bookNav setHidden:YES];
    self.navigationController.navigationBar.layer.opacity=1;
    [self.navigationController popViewControllerAnimated:YES];
}
@end
