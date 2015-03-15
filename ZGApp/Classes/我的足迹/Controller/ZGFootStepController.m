//
//  ZGFootStepController.m
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGFootStepController.h"

#import "ZGFootBookCell.h"
#import "ZGFootBook.h"
#import "ZGFootBookFrame.h"

#import "ZGFootCmtCell.h"
#import "ZGFootCmt.h"
#import "ZGFootCmtFrame.h"
@interface ZGFootStepController ()
@property(nonatomic,strong)NSMutableArray* curArray;
@end
@implementation ZGFootStepController


-(NSMutableArray *)curArray
{
    if (_curArray==nil) {
        _curArray=[NSMutableArray array];
    }
    return _curArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.bounces=NO;
    
    UIBarButtonItem* leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menubar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItem)];
    self.navigationItem.leftBarButtonItem=leftItem;
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
    
    self.navigationItem.title=@"我的足迹";
//    self.navigationController.view.userInteractionEnabled=YES;
    
    for (int i=0; i<5; i++) {
        ZGFootBook *book = [[ZGFootBook alloc] init];
        book.title = @"解忧百货店";
        book.author=@"(日)东野龟公";
        book.footTime=@"123123123123";
        ZGFootBookFrame* bookFrame=[[ZGFootBookFrame alloc]init];
        bookFrame.book=book;
        //        [_bookFArray addObject:bookFrame];
        [self.curArray addObject:bookFrame];
        
        if (i>2) {
            ZGFootCmt* comment=[[ZGFootCmt alloc]init];
            comment.comment_time=112124;
            comment.content=@"评论就评论，打个标点都这么奇怪，xcode是不是疯了，连set方法都不见了";
            comment.send_name=@"刘英滕";
            comment.comment_count=43;
            comment.like_count=77;
            comment.book_name=@"解忧百货店";
            ZGFootCmtFrame* commentFrame=[[ZGFootCmtFrame alloc]init];
            commentFrame.comment=comment;
            
            [self.curArray addObject:commentFrame];
        }
        else{
            ZGFootCmt* comment=[[ZGFootCmt alloc]init];
            comment.comment_time=112124;
            comment.content=@"评论就评论，打个标点都这么奇怪，xcode是不是疯了，连set方法都不见了";
            comment.send_name=@"刘英滕";
            comment.comment_count=43;
            comment.title=@"为什么一定要评论";
            comment.like_count=77;
            comment.book_name=@"解忧百货店";
            ZGFootCmtFrame* commentFrame=[[ZGFootCmtFrame alloc]init];
            commentFrame.comment=comment;
            
            [self.curArray addObject:commentFrame];
        }
        
    }
    
    self.tableView.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background_ip5"]];
    //    self.tableView.backgroundColor=[UIColor grayColor];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    // Do any additional setup after loading the view.
    
}
-(void)leftBarItem
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.curArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.curArray[indexPath.row] isKindOfClass:[ZGFootBookFrame class]]) {
        static NSString *CellIdentifier = @"Cell";
        
        ZGFootBookCell *cell = (ZGFootBookCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[ZGFootBookCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;
        }
        
        
        ZGFootBookFrame* bookFrame=self.curArray[indexPath.row];
        cell.bookF=bookFrame;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    else{
        static NSString *CellId = @"comment";
        
        ZGFootCmtCell *cell = (ZGFootCmtCell*)[tableView dequeueReusableCellWithIdentifier:CellId];
        if (cell == nil) {
            cell = [[ZGFootCmtCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellId] ;
        }
        
        
        ZGFootCmtFrame* commentFrame=self.curArray[indexPath.row];
        cell.commentFrame=commentFrame;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.curArray[indexPath.row]isKindOfClass:[ZGFootBookFrame class]]) {
        ZGFootBookFrame* bookFrame=self.curArray[indexPath.row];
        return bookFrame.cellHeight;
    }
    else{
        ZGFootCmtFrame* commentFrame=self.curArray[indexPath.row];
        return commentFrame.cellHeight;
    }
}

@end
