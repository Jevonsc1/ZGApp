//
//  BorrowViewController.m
//  TestBooking
//
//  Created by Jevons on 14/12/13.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "BorrowViewController.h"
#import "TBFriTableViewCell.h"
#import "TBCellModel.h"
#import "UIBarButtonItem+TB.h"
#import "BookScanViewController.h"
#import "MJRefresh.h"
#import "SearchController.h"
#import "TBNavigationController.h"
#import "ZGBookDetailController.h"
#import "ZGNotificationController.h"

#import "MBProgressHUD+MJ.h"
@interface BorrowViewController ()<MJRefreshBaseViewDelegate>
@property(nonatomic,strong)NSMutableArray* cellArray;
@property(nonatomic,weak)MJRefreshHeaderView* header;
@property(nonatomic,weak)MJRefreshFooterView* footer;

@end

@implementation BorrowViewController

-(NSMutableArray *)cellArray
{
    if(_cellArray==nil)
        _cellArray=[NSMutableArray array];
    
    return _cellArray;
}
//menubar_notificationcenter
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupArray];
    [self setupNav];
    [self setupRefreshView];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=NO;
    self.navigationController.navigationBar.barTintColor=JWColor(66, 181, 247);
}
-(void)setupRefreshView
{
//    MJRefreshHeaderView* header=[MJRefreshHeaderView header];
//    header.delegate=self;
//    header.scrollView=self.tableView;
//    [header beginRefreshing];
//    self.header=header;
    
    self.refreshControl=[[UIRefreshControl alloc]init];
    self.refreshControl.attributedTitle=[[NSAttributedString alloc]initWithString:@"hah"];
    [self.refreshControl addTarget:self action:@selector(loadNew) forControlEvents:UIControlEventValueChanged];
    
    MJRefreshFooterView* footer=[MJRefreshFooterView footer];
    footer.delegate=self;
    footer.scrollView=self.tableView;
    self.footer=footer;
    
    
}
-(void)dealloc
{
//    [self.header free];
    [self.footer free];

}

-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if ([refreshView isKindOfClass:[MJRefreshHeaderView class]]) {
        [self loadNew];
    }
    else{
        [self loadMore];
    }
}
-(void)loadNew{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.header endRefreshing];
        [self.refreshControl endRefreshing];

        [MBProgressHUD showSuccess:@"yo！！！"];
     
        
    });
  
}
-(void)loadMore
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self.footer endRefreshing];
    });
}
-(void)setupNav
{
    UIBarButtonItem* rightitem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menubar_search"] style:UIBarButtonItemStylePlain target:self action:@selector(RightItemClick)];
    UIBarButtonItem* leftitem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menubar_notificationcenter"] style:UIBarButtonItemStylePlain target:self action:@selector(LeftItemClick)];
    self.navigationItem.leftBarButtonItem=leftitem;
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=rightitem;
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
}
-(void)LeftItemClick
{
    ZGNotificationController* vc=[[ZGNotificationController alloc]init];
    TBNavigationController* nv=[[TBNavigationController alloc]initWithRootViewController:vc];
    
    [self presentModalViewController:nv animated:YES];
}
-(void)RightItemClick
{
//    CATransition *animation = [CATransition animation];
//    [animation setDuration:0.5];
//    [animation setType: @"oglFlip"];
//    [animation setSubtype: kCATransitionFromLeft];
//    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
//    [animation setDelegate:self];
//    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
    SearchController* vc=[[SearchController alloc]init];
    TBNavigationController* nv=[[TBNavigationController alloc]initWithRootViewController:vc];
    
    [self presentModalViewController:nv animated:YES];
    
//    [self.navigationController pushViewController:vc animated:YES];

   
    
}
-(void)setupArray
{
    [self setupCellModelWithBookname:@"解忧杂货店" author:@"(日)东野圭吾" category:@"小说" bookpic:@"JYZHD" friendname:@[@"吴迪Kevin",@"123",@"123",@"123"]];
    [self setupCellModelWithBookname:@"月亮与六便士" author:@"(英)毛姆" category:@"文学" bookpic:@"YL" friendname:@[@"梁径通"]];
    
    [self setupCellModelWithBookname:@"解忧杂货店" author:@"(日)东野圭吾" category:@"小说" bookpic:@"JYZHD" friendname:@[@"吴迪Kevin",@"123",@"123",@"123"]];
    [self setupCellModelWithBookname:@"月亮与六便士" author:@"(英)毛姆" category:@"文学" bookpic:@"YL" friendname:@[@"梁径通"]];
    [self setupCellModelWithBookname:@"月亮与六便士" author:@"(英)毛姆" category:@"文学" bookpic:@"YL" friendname:@[@"梁径通"]];
}

-(void)setupCellModelWithBookname:(NSString*)bookname author:(NSString*)author category:(NSString*)category bookpic:(NSString*)bookpic friendname:(NSArray*)friendname
{
    
    TBCellModel* model=[[TBCellModel alloc]init];
    model.author=author;
    model.bookname=bookname;
    model.bookpic = bookpic;
    model.friendname=friendname;
    model.category=category;
    [self.cellArray addObject:model];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }
    else return self.cellArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
   
    static NSString* ID=@"cell";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row==0) {
            cell.imageView.image=[UIImage imageNamed:@"page_jieyue_fishbook"];
            cell.textLabel.text=@"fishbook";
            cell.detailTextLabel.text=@"来钓本好书";
            cell.detailTextLabel.textColor=[UIColor grayColor];
            
        }
        else
        {
            cell.imageView.image=[UIImage imageNamed:@"page_jieyue_saoyisao"];
            cell.textLabel.text=@"扫一扫";
            cell.detailTextLabel.text=@"书籍条形码快速搜索";
            cell.detailTextLabel.textColor=[UIColor grayColor];
        }
    
    return cell;
    }
    else
    {
        TBFriTableViewCell* cell=[[TBFriTableViewCell alloc]init];
        cell.cellmodel=self.cellArray[indexPath.row];
        return cell;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
{
    if (section==0) {
        UIView* view=[[UIView alloc]init];
        view.backgroundColor=JWColor(233, 233, 233);
//        view.frame=CGRectMake(0, 0, self.view.bounds.size.width, 50);
        return view;
    }
    else return nil;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{


    if (section==1) {
        
        UIView* view=[[UIView alloc]init];
        view.backgroundColor=JWColor(247, 247, 247);
         UILabel* label=[[UILabel alloc]init];
        label.text=@"   好友可借阅书籍";
        label.textColor=JWColor(154, 154, 154);
        label.font=[UIFont systemFontOfSize:12];
        NSMutableDictionary* att=[NSMutableDictionary dictionary];
        att[NSFontAttributeName]=[UIFont systemFontOfSize:12];
        CGSize labelSize=[label.text sizeWithAttributes:att];
        label.frame=(CGRect){{0,12},labelSize};
//         label.backgroundColor=JWColor(247, 247, 247);
        label.backgroundColor=[UIColor clearColor];
        [view addSubview:label];
        
         return view;
    
    }
    
       else return nil;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section

{
    if (section==0) {
        return 120.0f;
    }
    
    else {
        return 0.1f;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    if (section==1) {
        return 30.0f;
    }else
        return 0.1f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 65;
    }
    else
    {
        return 73;
    }
}
//-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ((indexPath.section==0)&(indexPath.row==1)) {
//        BookScanViewController* bscanVC=[[BookScanViewController alloc]init];
//   
//        [self.navigationController pushViewController:bscanVC animated:YES];
//    }
//    else if(indexPath.section==1)
//    {
//        BookDetailController* db=[[BookDetailController alloc]init];
//        [self.navigationController pushViewController:db animated:YES];
//    }
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        if ((indexPath.section==0)&(indexPath.row==1)) {
            BookScanViewController* bscanVC=[[BookScanViewController alloc]init];
            
            [self.navigationController pushViewController:bscanVC animated:YES];
            
        }
        else if(indexPath.section==1)
        {
            ZGBookDetailController* db=[[ZGBookDetailController alloc]init];
            [self.navigationController pushViewController:db animated:YES];
        }
}
@end
