//
//  MySelfController.m
//  ZGApp
//
//  Created by Jevons on 15/2/1.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "MySelfController.h"
#import "ZGOrderController.h"
#import "ZGMyTopViewFrame.h"
#import "ZGMyTopView.h"
#import "ZGMySegView.h"
#import "ZGNotificationController.h"
#import "TBNavigationController.h"
#import "SearchController.h"
#import "ZGMyNavBar.h"
#import "ZGCollectionController.h"
#import "ZGFootStepController.h"
#import "SDProgressView.h"
#import "ZGMyBookOrderCell.h"
#import "UIImage+ImageEffects.h"

#import "ZGMyBookListCell.h"
#define segHeight 40
@interface MySelfController ()<ZGMyNavBarDelegate,ZGMyTopViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZGMySegViewDelegate>
@property(nonatomic,strong)ZGMyTopView* topView;

@property(nonatomic,strong)ZGMyTopViewFrame* topF;

@property(nonatomic,strong)NSMutableArray* curArray;
@property(nonatomic,strong)NSMutableArray* bookListArray;
@property(nonatomic,strong)NSMutableArray* bookOrderArray;
@property(nonatomic,strong)ZGMySegView* segView;
@property(nonatomic,strong)ZGMyNavBar* myNavBar;
@property(nonatomic,weak)SDTransparentPieProgressView* process;
@property(nonatomic,weak)UIImageView* backImage;
@end
@implementation MySelfController
-(NSMutableArray *)curArray
{
    if (_curArray==nil) {
        _curArray=[NSMutableArray array];
    }
    return _curArray;
}
-(NSMutableArray *)bookListArray
{
    if (_bookListArray==nil) {
        _bookListArray=[NSMutableArray array];
    }
    return _bookListArray;
}
-(NSMutableArray *)bookOrderArray
{
    if (_bookOrderArray==nil) {
        _bookOrderArray=[NSMutableArray array];
        
    }
    return _bookOrderArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.tableView.bounces=NO;
//    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZGMyBookOrderCell" bundle:nil] forCellReuseIdentifier:@"bookordercell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZGMyBookListCell" bundle:nil] forCellReuseIdentifier:@"bookListcell"];
    
    ZGMySegView* segView=[[ZGMySegView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, segHeight)];
    segView.delegate=self;
    self.segView=segView;
    
    for (int i=0; i<10; i++) {
        [ self setupArrayWithi:i];
    }
    [self.curArray addObjectsFromArray:self.bookListArray];
    [self setupUserAndTop];
    [self setupNav];
    
    [self setupProcess];
//      [self setupTopView];
  
    
    UIImage* image=[UIImage imageNamed:@"lobo"];
    image=[image applyBlurWithRadius:5.0 tintColor:nil saturationDeltaFactor:1 maskImage:nil];
    UIImageView* imageview=[[UIImageView alloc]initWithImage:image];
    imageview.frame=CGRectMake(0, 0, self.view.bounds.size.width, 400);
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.topF.viewHeight)];
    [view addSubview:imageview];
    self.tableView.backgroundView=view;
    self.backImage=imageview;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:1];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    
}
-(void)setupProcess
{
    SDTransparentPieProgressView* pro=[SDTransparentPieProgressView progressView];
    pro.frame=CGRectMake(self.tableView.frame.size.width*0.5-20, -60, 30, 30);
    [pro setHidden:NO];
    self.process=pro;
    [self.tableView addSubview:pro];
                                       
}
-(void)setupArrayWithi:(int)i
{
    ZGBookList* booklist=[[ZGBookList alloc]init];
    ZGBook* libook=[[ZGBook alloc]init];
    libook.title=@"书名";
    libook.author=@"作者";
    booklist.bookstatus=i%2+1;
    booklist.book=libook;
    [self.bookListArray addObject:booklist];
    
    
    
    ZGOrder* order=[[ZGOrder alloc]init];
    ZGBook* orbook=[[ZGBook alloc]init];
    orbook.title=@"asdfasdf";
    ZGUser* user=[[ZGUser alloc]init];
    user.userName=@"123";
    order.Opposite=user;
    order.status=ZGOrderStatusTypeReciverThree;
    order.book=orbook;
    [self.bookOrderArray addObject:order];
    
    
}

-(void)setupUserAndTop
{
    ZGUser* user=[[ZGUser alloc]init];
    user.iconImage=[UIImage imageNamed:@"user1"];
    user.userIntro=@"知更的iOS开发者";
    user.sex=1;
    user.rank=7;
    user.userName=@"郑泓硕";
    user.tags=[NSArray arrayWithObjects:@"设计",@"艺术",@"互联网", @"设计",@"艺术",@"互联网",nil];
    self.user=user;
    
    ZGMyTopViewFrame* topF=[[ZGMyTopViewFrame alloc]init];
    topF.user=user;
    self.topF=topF;
}
-(void)setupNav
{
    UIImageView* barBG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 63)];
    barBG.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"memubar_book_background"]];
    [self.navigationController.view addSubview:barBG];
    
   ZGMyNavBar* bar=[[ZGMyNavBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 65)];
    bar.name=self.user.userName;
    bar.delegate=self;
    bar.backgroundColor=Blue;
    self.myNavBar=bar;
    [self.navigationController.view addSubview:bar];
    
}
//-(void)setupTopView
//{
//    ZGMyTopView* topView=[[ZGMyTopView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.topF.viewHeight)];
//    topView.topF=self.topF;
//    topView.delegate=self;
//    topView.backgroundColor=[UIColor grayColor];
//    self.topView=topView;
//}
-(void)LeftItemClick
{
    ZGNotificationController* vc=[[ZGNotificationController alloc]init];
    TBNavigationController* nv=[[TBNavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nv animated:YES completion:nil];
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
    
  [self presentViewController:nv animated:YES completion:nil];
    
    //    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        

        return 0;
    }
    else{
        return self.curArray.count;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
 
    if (section == 0) {
        ZGMyTopView* topView=[[ZGMyTopView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.topF.viewHeight)];
        topView.topF=self.topF;
        topView.backgroundColor=[UIColor clearColor];
        topView.delegate=self;
      
        
        return topView;
        
    }
    else {
   
//       return nil;
        return self.segView;
    }
 
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.curArray[0] isKindOfClass:[ZGBookList class]])
    {
        
        static NSString* ID=@"bookListcell";
        ZGMyBookListCell* cell =[tableView dequeueReusableCellWithIdentifier:ID];
             
        if (cell==nil)
        {
            cell=[[ZGMyBookListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
           
        }
        cell.booklist=self.curArray[indexPath.row];
        
         return cell;
        
    }
    else
    {
        static NSString* ID=@"bookordercell";
        ZGMyBookOrderCell* cell =[tableView dequeueReusableCellWithIdentifier:ID];
        if (cell==nil)
        {
            cell=[[ZGMyBookOrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.order=self.curArray[indexPath.row];
        return cell;
    
    
    
   
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
    {
    if (section==0) {

        return self.topF.viewHeight;
    }
    else {
        return segHeight;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 0;
    }
    else
    {
        return 105.0f;
    }
}
-(void)navBarWithBtnNotif:(ZGMyNavBar *)navBar
{
    ZGNotificationController* vc=[[ZGNotificationController alloc]init];
    TBNavigationController* nv=[[TBNavigationController alloc]initWithRootViewController:vc];
    
   
    [self presentViewController:nv animated:YES completion:nil];
}
-(void)navBarWithBtnSearch:(ZGMyNavBar *)navBar
{
    SearchController* vc=[[SearchController alloc]init];
    TBNavigationController* nv=[[TBNavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nv animated:YES completion:nil];
}
-(void)topViewWithColBtn:(ZGMyTopView *)topView
{
    ZGCollectionController* vc=[[ZGCollectionController alloc]init];
    TBNavigationController* nv=[[TBNavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nv animated:YES completion:nil];
}

-(void)topViewWithFootStepBtn:(ZGMyTopView *)topView
{
    ZGFootStepController* vc=[[ZGFootStepController alloc]init];
    TBNavigationController* nv=[[TBNavigationController alloc]initWithRootViewController:vc];
    
   [self presentViewController:nv animated:YES completion:nil];
//    ZGOrderController* vc=[[ZGOrderController alloc]init];
//    TBNavigationController* nv=[[TBNavigationController alloc]initWithRootViewController:vc];
//    [self presentViewController:nv animated:YES completion:nil];
}

-(void)topViewWithCameraBtn:(ZGMyTopView *)topView btn:(NSInteger)btnNum{
    UIImagePickerController *ipc=[[UIImagePickerController alloc]init];
      if (btnNum==1) {
         ipc.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
       }
    else if(btnNum==0) {
        ipc.sourceType=UIImagePickerControllerSourceTypeCamera;
    }
    ipc.delegate=self;
    [self presentViewController:ipc animated:YES completion:nil];

    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image=info[UIImagePickerControllerOriginalImage];
//    self.iconImage=image;
    
    self.user.iconImage=image;
    [self.tableView reloadData];
    
}

-(void)ZGMySegView:(ZGMySegView *)view btn:(int)btnTag
{
    if (btnTag==1) {
        [self.curArray removeAllObjects];
        [self.curArray addObjectsFromArray:self.bookListArray];
        [self.tableView reloadData];
    }
    else
    {
        [self.curArray removeAllObjects];
        [self.curArray addObjectsFromArray:self.bookOrderArray];
         [self.tableView reloadData];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1&& [self.curArray[0] isKindOfClass:[ZGOrder class]]) {
            ZGOrderController* vc=[[ZGOrderController alloc]init];
            vc.order=self.curArray[indexPath.row];
            TBNavigationController* nv=[[TBNavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nv animated:YES completion:nil];
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.process setHidden:NO];
    
    if (scrollView.contentOffset.y<0) {
        self.process.progress=((int)floor(-scrollView.contentOffset.y))%100/100.0;
    }
    
   
    self.myNavBar.backgroundColor=[UIColor colorWithRed:66/255.0 green:181/255.0 blue:247/255.0 alpha:scrollView.contentOffset.y/100];
    self.backImage.layer.anchorPoint=CGPointMake(0.5, 0);
    self.backImage.layer.position=CGPointMake(self.tableView.frame.size.width*0.5, 0);
    self.navigationController.navigationBar.layer.opacity=0;
    if(scrollView.contentOffset.y<-20)
        self.backImage.transform=CGAffineTransformMakeScale(1-(scrollView.contentOffset.y+20)/100, 1-(scrollView.contentOffset.y+20)/100);
  

}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    
//    NSTimer* timer=[NSTimer timerWithTimeInterval:0.05 target:self selector:@selector(loading) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)loading
{
    self.process.transform=CGAffineTransformMakeTranslation(0, 100);
    
    static CGFloat progress = 0;
    
    if (progress < 1.0) {
        progress += 0.05;
        
        // 循环
        if (progress >= 1.0) progress = 0;
      
            self.process.progress = progress;
       
    }
}
@end


