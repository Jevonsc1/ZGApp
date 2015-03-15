
//
//  ZGCollectionController.m
//  ZGApp
//
//  Created by Jevons on 15/2/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGCollectionController.h"
#import "ZGCollecBookCell.h"
#import "ZGCollectBook.h"
#import "ZGColBookFrame.h"
#import "ZGColBottomView.h"
#import "ZGBookComCell.h"
#import "ZGBookComFrame.h"
@interface ZGCollectionController ()<ZGColBottomViewDelegate>
@property(nonatomic,weak)ZGColBottomView* bottomView;

@property(nonatomic,strong)NSMutableArray* curArray;
@property(nonatomic,strong)NSMutableArray* deleArray;
@end

@implementation ZGCollectionController
-(NSMutableArray*)deleArray
{
    if (_deleArray==nil) {
        _deleArray=[NSMutableArray array];
    }
    return _deleArray;
}
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
    self.tableView.allowsSelectionDuringEditing = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"管理" style:UIBarButtonItemStyleDone target:self action:@selector(setEditing:animated:)];
    
    UIBarButtonItem* leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menubar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItem)];
    self.navigationItem.leftBarButtonItem=leftItem;
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];

    self.navigationItem.title=@"我的收藏";
    self.navigationController.view.userInteractionEnabled=YES;
    
    for (int i=0; i<5; i++) {
        ZGCollectBook *book = [[ZGCollectBook alloc] init];
        book.title = @"解忧百货店";
        book.author=@"(日)东野龟公";
        book.ColTime=@"123123123123";
        ZGColBookFrame* bookFrame=[[ZGColBookFrame alloc]init];
        bookFrame.book=book;
        bookFrame.isChecked=NO;
//        [_bookFArray addObject:bookFrame];
        [self.curArray addObject:bookFrame];
        
        if (i>2) {
            ZGBookCmt* comment=[[ZGBookCmt alloc]init];
            comment.comment_time=112124;
            comment.content=@"评论就评论，打个标点都这么奇怪，xcode是不是疯了，连set方法都不见了";
            comment.send_name=@"刘英滕";
            comment.comment_count=43;
            comment.like_count=77;
            comment.book_name=@"解忧百货店";
            ZGBookComFrame* commentFrame=[[ZGBookComFrame alloc]init];
            commentFrame.comment=comment;
            commentFrame.isChecked=NO;
            
            [self.curArray addObject:commentFrame];
        }
        else{
        ZGBookCmt* comment=[[ZGBookCmt alloc]init];
        comment.comment_time=112124;
        comment.content=@"评论就评论，打个标点都这么奇怪，xcode是不是疯了，连set方法都不见了";
        comment.send_name=@"刘英滕";
        comment.comment_count=43;
        comment.title=@"为什么一定要评论";
        comment.like_count=77;
        comment.book_name=@"解忧百货店";
        ZGBookComFrame* commentFrame=[[ZGBookComFrame alloc]init];
        commentFrame.comment=comment;
        commentFrame.isChecked=NO;
        
        [self.curArray addObject:commentFrame];
        }
    
    }
    
    self.tableView.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background_ip5"]];
//    self.tableView.backgroundColor=[UIColor grayColor];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    // Do any additional setup after loading the view.
    
  
    ZGColBottomView* bottomView=[[ZGColBottomView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height+20, self.view.frame.size.width, 50)];
    bottomView.delegate=self;
    [self.navigationController.view addSubview:bottomView];
    self.bottomView=bottomView;
}
-(void)leftBarItem
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void) setEditing:(BOOL)editting animated:(BOOL)animated
{
    if (self.editing) {
        self.navigationItem.rightBarButtonItem.title=@"管理";
        [UIView animateWithDuration:0.2 animations:^{
            self.bottomView.transform=CGAffineTransformIdentity;
        }];
    }
    else{
        self.navigationItem.rightBarButtonItem.title=@"取消";
        [UIView animateWithDuration:0.2 animations:^{
            self.bottomView.transform=CGAffineTransformMakeTranslation(0, -50);
        }];
        
    }
    [super setEditing:!self.editing animated:YES];
    [self.tableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.3];
    
//        [self.tableView reloadData];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.curArray.count;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.curArray[indexPath.row] isKindOfClass:[ZGColBookFrame class]]) {
        static NSString *CellIdentifier = @"Cell";
        
        ZGCollecBookCell *cell = (ZGCollecBookCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[ZGCollecBookCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;
        }
        
        
        ZGColBookFrame* bookFrame=self.curArray[indexPath.row];
        cell.bookF=bookFrame;
        [cell setChecked:bookFrame.isChecked];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
 
    }
    else{
        static NSString *CellId = @"comment";
        
        ZGBookComCell *cell = (ZGBookComCell*)[tableView dequeueReusableCellWithIdentifier:CellId];
        if (cell == nil) {
            cell = [[ZGBookComCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellId] ;
        }
        
        
        ZGBookComFrame* commentFrame=self.curArray[indexPath.row];
        cell.commentFrame=commentFrame;
        [cell setChecked:commentFrame.isChecked];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.curArray[indexPath.row] isKindOfClass:[ZGColBookFrame class]]) {
        ZGColBookFrame* bookFrame = [self.curArray objectAtIndex:indexPath.row];
        
        if (self.editing)
        {
            ZGCollecBookCell *cell = (ZGCollecBookCell*)[tableView cellForRowAtIndexPath:indexPath];
            bookFrame.isChecked = !bookFrame.isChecked;
            [cell setChecked:bookFrame.isChecked];
        }

    }
    else{
        ZGBookComFrame* commentFrame = [self.curArray objectAtIndex:indexPath.row];
        
        if (self.editing)
        {
            ZGBookComCell *cell = (ZGBookComCell*)[tableView cellForRowAtIndexPath:indexPath];
            commentFrame.isChecked = !commentFrame.isChecked;
            [cell setChecked:commentFrame.isChecked];
        }
    }
        [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.curArray[indexPath.row]isKindOfClass:[ZGColBookFrame class]]) {
        ZGColBookFrame* bookFrame=self.curArray[indexPath.row];
        return bookFrame.cellHeight;
    }
    else{
        ZGBookComFrame* commentFrame=self.curArray[indexPath.row];
        return commentFrame.cellHeight;
    }
}
-(void)bottomViewWithSeleAll:(ZGColBottomView *)ZGColBottomView
{
    for (int i=0; i<self.curArray.count; i++) {
        if ([self.curArray[i] isKindOfClass:[ZGColBookFrame class]]) {
            ZGColBookFrame* bookF=self.curArray[i];
            bookF.isChecked=YES;
        }
        else{
            ZGBookComFrame* commentF=self.curArray[i];
            commentF.isChecked=YES;
        }
            
    }
    [self.tableView reloadData];
}
-(void)bottomViewWithDele:(ZGColBottomView *)ZGColBottomView
{
  
}

@end


