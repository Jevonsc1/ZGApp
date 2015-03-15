//
//  ContactViewController.m
//  ZGApp
//
//  Created by Jevons on 15/1/20.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ContactViewController.h"
#import  "imCacheData.h"
#import "IMCacheCell.h"
#import "IMTableController.h"
#import "ZGContactController.h"
@interface ContactViewController ()
@property(nonatomic,strong)NSMutableArray* imArray;

@end

@implementation ContactViewController

-(NSMutableArray *)imArray
{
    if (_imArray==nil) {
        _imArray=[NSMutableArray array];
    }
    return _imArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCellArray];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=NO;
    
}


-(void)setupCellArray
{
    [self setupWithIcon:@"user1" name:@"梁径通" message:@"很忙，有空联系你" date:@"昨天"];
    [self setupWithIcon:@"user2" name:@"22222" message:@"2222" date:@"昨天"];
    [self setupWithIcon:@"user3" name:@"33333" message:@"333333" date:@"昨天"];
    [self setupWithIcon:@"user4" name:@"44444" message:@"444444" date:@"昨天"];
}

-(void)setupWithIcon:(NSString*)icon name:(NSString*)name message:(NSString*)message date:(NSString*)date
{
    imCacheData* model=[[imCacheData alloc]init];
    model.icon=icon;
    model.name=name;
    model.message=message;
    model.date=date;
    
    [self.imArray addObject:model];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 2;
    }
    return self.imArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
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
            cell.imageView.image=[UIImage imageNamed:@"page_naonow_tianjiahaoyou"];
            cell.textLabel.text=@"添加好友";
            cell.detailTextLabel.text=@"认识兴趣相投的书友";
            cell.detailTextLabel.textColor=[UIColor grayColor];
            
        }
        else
        {
            cell.imageView.image=[UIImage imageNamed:@"page_naonow_tongxunlu"];
            cell.textLabel.text=@"通讯录";
            cell.detailTextLabel.text=@"31位好友";
            cell.detailTextLabel.textColor=[UIColor grayColor];
        }
        
        return cell;
    }
    else{
  
    IMCacheCell* cell=[IMCacheCell initWithTableView:tableView];
    cell.model=self.imArray[indexPath.row];
    return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        
        
        return 80;
    }
    else{
        return 60;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section

{
    if (section==0) {
        return 30.0f;
    }
    
    else {
        return 0.1f;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0&&indexPath.row==1) {
        ZGContactController* contact=[[ZGContactController alloc]init];
        [self.navigationController pushViewController:contact animated:YES];
    }
    if (indexPath.section==1) {
        IMTableController* imvc=[[IMTableController alloc]init];
        imvc.imdata=self.imArray[indexPath.row];
        [self.navigationController pushViewController:imvc animated:YES];
        
    }
}

@end
