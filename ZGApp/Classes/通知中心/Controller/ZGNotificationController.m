//
//  ZGNotificationController.m
//  ZGApp
//
//  Created by Jevons on 15/1/28.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGNotificationController.h"
#import "ZGNotifiationSegView.h"
#import "LittLeBlueRow.h"
#import "ZGNotificationCell.h"
#import "ZGNofCellFrame.h"
#import "ZGNofCellData.h"


@interface ZGNotificationController ()<ZGNotifiationSegViewDelegate>
@property(nonatomic,strong)NSMutableArray* frameArray;
@property(nonatomic,strong)NSMutableArray* OrderArray;
@property(nonatomic,strong)NSMutableArray* FriArray;
@property(nonatomic,strong)NSMutableArray* BookListArray;
@property(nonatomic,strong)NSMutableArray* CommentArray;
@property(nonatomic,strong)NSMutableArray* curArray;

@property(nonatomic,strong)ZGNotifiationSegView* Segment;
@end

@implementation ZGNotificationController
-(NSMutableArray *)frameArray
{
    if(_frameArray==nil){
        _frameArray=[NSMutableArray array];
    }
    return _frameArray;
}

-(NSMutableArray *)OrderArray
{
    if(_OrderArray==nil){
        _OrderArray=[NSMutableArray array];
    }
    return _OrderArray;
}

-(NSMutableArray *)CommentArray
{
    if(_CommentArray==nil){
        _CommentArray=[NSMutableArray array];
    }
    return _CommentArray;
}

-(NSMutableArray *)FriArray
{
    if(_FriArray==nil){
        _FriArray=[NSMutableArray array];
    }
    return _FriArray;
}


-(NSMutableArray *)BookListArray
{
    if(_BookListArray==nil){
        _BookListArray=[NSMutableArray array];
    }
    return _BookListArray;
}

-(NSMutableArray *)curArray
{
    if (_curArray==nil) {
        _curArray=[NSMutableArray array];
    }
    return _curArray;
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [self.Segment btnClick:self.Segment.btnArray[0]];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
   UIBarButtonItem* leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menubar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItem)];
    self.navigationItem.leftBarButtonItem=leftItem;
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    
    UIBarButtonItem* rightItem=[[UIBarButtonItem alloc]initWithTitle:@"全部已读" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarItem)];
    self.navigationItem.rightBarButtonItem=rightItem;
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
    
    self.navigationItem.title=@"通知中心";
    
    self.tableView.bounces=NO;
    self.tableView.userInteractionEnabled=YES;
    
    LittLeBlueRow* Bluerow=[[LittLeBlueRow alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+20, self.view.frame.size.width, 1)];
    [self.navigationController.view addSubview:Bluerow];
    
    self.tableView.userInteractionEnabled=YES;
    
    [self setupArray];
    
    
    ZGNotifiationSegView* segment=[[ZGNotifiationSegView alloc]init];
    segment.delegate=self;
    self.Segment=segment;
    
    
    
}
/**
 *  用来设计个人的的代码
 */
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.barTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"memubar_book_background"]];
//    //   self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
//    self.navigationController.navigationBar.alpha  = 0.100;
//    self.navigationController.navigationBar.backgroundColor=[UIColor clearColor];
//    self.navigationController.navigationBar.translucent  =  YES ;
//    [self.tableView setContentOffset:CGPointMake(0, 64) animated:NO];
//}
//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//  self.navigationController.navigationBar.barTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"memubar_book_background"]];
////   self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
//   self.navigationController.navigationBar.alpha  = 0.100;
//   self.navigationController.navigationBar.backgroundColor=[UIColor clearColor];
//   self.navigationController.navigationBar.translucent  =  YES ;
//    
//}
-(void)setupArray
{
    [self setupCellModelWithStyle:cellIconStyleAddFri name:@"郑泓硕" detail:@"我是个可悲的iOS工人" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleComment name:@"无敌回复了你的书评" detail:@"你写的那些东西喔看不懂，哈哈哈哈哈哈哈哈哈哈哈哈哈" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleOrder name:@"东京" detail:@"待梁径通借出《东京》" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleBooklist name:@"解忧杂货店" detail:@"您想读书单中的《解忧杂货店》现在可以借阅了" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleAddFri name:@"郑泓硕" detail:@"我是个可悲的iOS工人" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleComment name:@"无敌回复了你的书评" detail:@"你写的那些东西喔看不懂，哈哈哈哈哈哈哈哈哈哈哈哈哈" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleOrder name:@"东京" detail:@"待梁径通借出《东京》" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleBooklist name:@"解忧杂货店" detail:@"您想读书单中的《解忧杂货店》现在可以借阅了" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleComment name:@"无敌回复了你的书评" detail:@"你写的那些东西喔看不懂，哈哈哈哈哈哈哈哈哈哈哈哈哈" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleOrder name:@"东京" detail:@"待梁径通借出《东京》" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleBooklist name:@"解忧杂货店" detail:@"您想读书单中的《解忧杂货店》现在可以借阅了" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleAddFri name:@"郑泓硕" detail:@"我是个可悲的iOS工人" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleComment name:@"无敌回复了你的书评" detail:@"你写的那些东西喔看不懂，哈哈哈哈哈哈哈哈哈哈哈哈哈" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleOrder name:@"东京" detail:@"待梁径通借出《东京》" iconUrl:nil];
    [self setupCellModelWithStyle:cellIconStyleBooklist name:@"解忧杂货店" detail:@"您想读书单中的《解忧杂货店》现在可以借阅了" iconUrl:nil];

    [self.curArray addObjectsFromArray:self.frameArray];
}
-(void)setupCellModelWithStyle:(cellIconStyle)style name:(NSString*)name detail:(NSString*) detail iconUrl:(NSString*)iconUrl
{
    ZGNofCellData* data =[[ZGNofCellData alloc]init];
    data.style=style;
    data.name=name;
    data.detailText=detail;
    data.IconUrl=iconUrl;
    [self.frameArray addObject:data];

    switch (style) {
        case  cellIconStyleOrder:
            [self.OrderArray addObject:data];
            break;
            
        case  cellIconStyleAddFri:
           [ self.FriArray addObject:data];
            break;
        case  cellIconStyleBooklist:
            [self.BookListArray addObject:data];
            break;
            
        case  cellIconStyleComment:
            [self.CommentArray addObject:data];
            break;
            
        default:
            break;
    }
}
-(void)rightBarItem
{
    
}
-(void)leftBarItem
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

        return self.curArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZGNotificationCell* cell=[ZGNotificationCell initWithTableview:tableView];
    
    ZGNofCellFrame* row=[[ZGNofCellFrame alloc]init];
    row.celldata=self.curArray[indexPath.row];
    
    cell.cellFrame=row;
    
    return cell;
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return self.Segment;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 34.0f;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZGNofCellFrame* row=[[ZGNofCellFrame alloc]init];
    row.celldata=self.curArray[indexPath.row];
    return row.cellHeight;
}


-(void)segmentView:(ZGNotifiationSegView *)segmentView button:(int)tag
{
//    [self.Segment.curBtn setTitle:@"yo!" forState:UIControlStateNormal];
    [self.curArray removeAllObjects];
    
    if(tag==0)
  {
      
      [self.curArray addObjectsFromArray:self.frameArray];
      [self.tableView reloadData];
      
  }else if (tag==1){
      [self.curArray addObjectsFromArray:self.OrderArray];
      [self.tableView reloadData];
      
  }else if(tag==2){

      [self.curArray addObjectsFromArray:self.FriArray];
      [self.tableView reloadData];
      
  }else if(tag==3){
   
      [self.curArray addObjectsFromArray:self.BookListArray];
      [self.tableView reloadData];
      
  }else{
   
      [self.curArray addObjectsFromArray:self.CommentArray];
      [self.tableView reloadData];
  }

}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
