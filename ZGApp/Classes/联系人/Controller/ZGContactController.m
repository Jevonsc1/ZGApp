//
//  ZGContactController.m
//  ZGApp
//
//  Created by Jevons on 15/1/26.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGContactController.h"
#import "ZGUserController.h"
@interface ZGContactController ()
@property(nonatomic,strong)NSMutableArray* firArray;

@end

@implementation ZGContactController
-(NSMutableArray *)firArray
{
    if (_firArray==nil) {
        _firArray=[NSMutableArray array];
    }
    return _firArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self setupFriArray];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
    
}
-(void)setupFriArray
{
    for (int i =0; i<20; i++) {
        NSString* str=[NSString stringWithFormat:@"郑泓硕%d",i];
        [self.firArray addObject:str];
    }
}

-(void)setupNav
{
    UIBarButtonItem* backItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menubar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItem)];
    backItem.tintColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=backItem;
    
    self.navigationItem.title=@"通讯录";
}
-(void)leftBarItem
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {


    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.firArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* ID=@"cell";
    UITableViewCell* cell =[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.imageView.image=[UIImage imageNamed:@"user4"];
        cell.textLabel.text=self.firArray[indexPath.row];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZGUserController* userVc=[[ZGUserController alloc]init];
    
    [self.navigationController pushViewController:userVc animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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
