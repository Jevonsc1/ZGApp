//
//  SearchController.m
//  ZGApp
//
//  Created by Jevons on 15/1/22.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "SearchController.h"
#import "ZGSearchBar.h"
#import "AFNetworking.h"
#import "ZGBook.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "ZGBookResult.h"
#import "ZGBookDetailController.h"
#import "ZGSegementView.h"
#import "ZGBookDetailTopView.h"
#import "ZGTags.h"
#import "ZGTagsCell.h"

#import "ZGMyTagCell.h"

@interface SearchController ()<UISearchBarDelegate,ZGSegementViewDelegate,ZGTagsCellDelegate>
@property(nonatomic,strong)NSArray* BookArray;
@property(nonatomic,strong)NSArray* TagsArray;
@property(nonatomic,weak)UISearchBar* searchBar;
@property(nonatomic,assign)BOOL isUser;
@property(nonatomic,strong)NSMutableArray* curArray;
@property(nonatomic,strong)ZGMyTagCell* tagcell;
@end

@implementation SearchController
-(NSMutableArray*)curArray{
    if (_curArray==nil) {
        _curArray=[NSMutableArray array];
    }
    return _curArray;
}
-(NSArray*)TagsArray
{
    if(_TagsArray==nil){
        _TagsArray=[NSArray array];
    }
    return _TagsArray;
}
-(NSArray *)BookArray{
    if (_BookArray==nil) {
        _BookArray=[NSArray array];
    }
    return _BookArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.bounces=NO;
    self.tableView.userInteractionEnabled=YES;
    
    [self setupTagsArray];
    
    [self setupSearchBar];
    
    UIBarButtonItem* btn=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];

    self.navigationItem.rightBarButtonItem=btn;
    self.isUser=NO;
    
    ZGMyTagCell* cell=[[ZGMyTagCell alloc]init];
    cell.mylabel.text=@"我的标签";
    cell.tagArray=@[@"经济学大发大发",@"管理",@"金融",@"商业",@"营销我饿啊的"];
    self.tagcell=cell;
}

-(void)setupTagsArray
{
    ZGTags* tagGrp=[[ZGTags alloc]init];
    tagGrp.tagTitle=@"文学";
    tagGrp.tagArray=@[@"小说",@"随笔",@"散文",@"日本文学",@"童话",@"诗歌",@"名著",@"港台"];

    ZGTags* tagGrp1=[[ZGTags alloc]init];
    tagGrp1.tagTitle=@"流行";
    tagGrp1.tagArray=@[@"漫画",@"绘本",@"推理",@"青春",@"言情",@"科幻",@"武侠",@"奇幻"];

    ZGTags* tagGrp2=[[ZGTags alloc]init];
    tagGrp2.tagTitle=@"文化";
    tagGrp2.tagArray=@[@"历史",@"哲学",@"传记",@"设计",@"建筑",@"电影",@"回忆录",@"音乐"];

    
    ZGTags* tagGrp3=[[ZGTags alloc]init];
    tagGrp3.tagTitle=@"生活";
    tagGrp3.tagArray=@[@"旅行",@"励志",@"职场",@"美食",@"教育",@"灵修",@"健康",@"家居"];

    ZGTags* tagGrp4=[[ZGTags alloc]init];
    tagGrp4.tagTitle=@"经管";
    tagGrp4.tagArray=@[@"经济学",@"管理",@"金融",@"商业",@"营销",@"理财",@"股票",@"企业史"];


    ZGTags* tagGrp5=[[ZGTags alloc]init];
    tagGrp5.tagTitle=@"科技";
    tagGrp5.tagArray=@[@"科普",@"互联网",@"编程",@"交互设计",@"算法",@"通信",@"神经网络"];
    self.TagsArray=@[tagGrp,tagGrp1,tagGrp2,tagGrp3,tagGrp4,tagGrp5];
    
    
    [self.curArray addObjectsFromArray:self.TagsArray];
    
}
-(void)setupSearchBar
{
    UISearchBar* search=[[UISearchBar alloc]init];
    search.frame=CGRectMake(0, 0, 270, 30);
    search.placeholder=@"书籍";
    search.delegate=self;

    self.searchBar=search;
//    [search becomeFirstResponder];
    self.navigationItem.titleView=search;
}
-(void)cancel
{
    
    [self.navigationItem.titleView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length==0) {
        [self.curArray removeAllObjects];
        [self.curArray addObjectsFromArray:self.TagsArray];
        [self.tableView reloadData];
    }
    else{
        if (self.isUser) {
            
        }
        else{
            AFHTTPRequestOperationManager* mgr=[AFHTTPRequestOperationManager manager];
            NSMutableDictionary* params=[NSMutableDictionary dictionary];
            params[@"q"]=searchText;
            params[@"count"]=@(20);
            [mgr GET:@"" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
                [mgr GET:@"https://api.douban.com/v2/book/search" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    self.BookArray=[ZGBook objectArrayWithKeyValuesArray:responseObject[@"books"]];
                    
                    
                    NSArray* array=responseObject[@"books"];
                    for (int i=0; i<array.count; i++) {
                        ZGBook* book=self.BookArray[i];
                        NSArray* ary=array[i][@"author"];
                        if(ary.count==0)
                        {
                            book.author=@"";
                        }else{
                            book.author=ary[0];
                        }
                        
                    }
                    [self.curArray removeAllObjects];
                    [self.curArray addObjectsFromArray:self.BookArray];
                    [self.tableView reloadData];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    
                }];
            }];
        }
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.curArray[0] isKindOfClass:[ZGTags class]]) {
        return (self.curArray.count+2);
    }
    else{
    return self.curArray.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    if ([self.curArray[0] isKindOfClass:[ZGBook class]]) {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        ZGBook* book=self.curArray[indexPath.row];
        
        cell.textLabel.text=book.title;
        cell.detailTextLabel.text=book.author;
        [cell.imageView setImageWithURL:[NSURL URLWithString:book.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]];
        cell.imageView.layer.borderWidth=4;
        
        cell.imageView.layer.borderColor=[UIColor whiteColor].CGColor;
        
        return cell;
        
    }
    else{
        if (indexPath.row==0) {
            UITableViewCell* cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
            cell.imageView.image=[UIImage imageNamed:@"page_jieyue_saoyisao"];
            cell.textLabel.text=@"扫一扫";
            cell.detailTextLabel.text=@"书籍条形码快速搜索";
            cell.detailTextLabel.textColor=[UIColor lightGrayColor];
            return cell;
        }
        else if(indexPath.row==1){
           
            return self.tagcell;
        }
        else{
        ZGTagsCell* tagCell=[ZGTagsCell cellWithTable:tableView];
        tagCell.delegate=self;
        ZGTags* tags=self.curArray[indexPath.row-2];
        tagCell.tags=tags;
        return tagCell;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.curArray[0] isKindOfClass:[ZGTags class]])
    {
        if (indexPath.row==0) {
            return 70;
        }
        else if (indexPath.row==1)
        {
            return self.tagcell.cellHeight;
        }
        else
        {
        return SearchTagCellHeight;
        }
    }
    else
    {
    return 70;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZGSegementView* segement=[[ZGSegementView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 20)];
    segement.delegate=self;
    return segement;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.curArray[0] isKindOfClass:[ZGBook class]]) {
        [self.searchBar resignFirstResponder];
        ZGBookDetailController* bdc=[[ZGBookDetailController alloc]init];
        ZGBookDetailFrame* DFrame=[[ZGBookDetailFrame alloc]init];
        DFrame.book=self.BookArray[indexPath.row];
        bdc.TopDetailFrame=DFrame;
        [self.navigationController pushViewController:bdc animated:YES];
    }
   
    
    
}
-(void)tagscell:(ZGTagsCell *)ZGTagsCell withBtnTitle:(NSString *)title
{
    
//    [self.tableView reloadData];
    self.searchBar.text=title;
    AFHTTPRequestOperationManager* mgr=[AFHTTPRequestOperationManager manager];
    NSMutableDictionary* params=[NSMutableDictionary dictionary];
    params[@"tag"]=title;
    params[@"count"]=@(10);
    [mgr GET:@"" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [mgr GET:@"https://api.douban.com/v2/book/search" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            self.BookArray=[ZGBook objectArrayWithKeyValuesArray:responseObject[@"books"]];
            
            
            NSArray* array=responseObject[@"books"];
            for (int i=0; i<array.count; i++) {
                ZGBook* book=self.BookArray[i];
                NSArray* ary=array[i][@"author"];
                if(ary.count==0)
                {
                    book.author=@"";
                }else{
                    book.author=ary[0];
                }
                
            }
            [self.curArray removeAllObjects];
            [self.curArray addObjectsFromArray:self.BookArray];
            [self.tableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
    }];

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.searchBar resignFirstResponder];
}
-(void)segView:(ZGSegementView *)view btnTag:(int)btntag
{
    self.isUser=(BOOL)btntag;
}

@end
