//
//  IMTableController.m
//  ZGApp
//
//  Created by Jevons on 15/1/23.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "IMTableController.h"
#import "IMChatToolBar.h"
#import "IMChatCell.h"
#import "IMChatData.h"
#define JWNotificationCenter [NSNotificationCenter defaultCenter]
@interface IMTableController ()<IMChatToolBarDelegate>
@property(nonatomic,weak)IMChatToolBar* toolbar;
@property(nonatomic,strong)NSMutableArray* chatDataArray;
@end

@implementation IMTableController

-(NSMutableArray *)chatDataArray{
    if (_chatDataArray==nil) {
        _chatDataArray=[NSMutableArray array];
    }
    return _chatDataArray;
}
-(void)setImdata:(imCacheData *)imdata
{
    _imdata=imdata;
    self.navigationItem.title=imdata.name;
    [self setupNav];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor=JWColor(240, 240, 240);
    [self setupToolBar];
    

}

-(void)setupNav
{
    UIBarButtonItem* backItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menubar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItem)];
    backItem.tintColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=backItem;
    
}
-(void)leftBarItem
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
    [self.toolbar setHidden:NO];
    [self.toolbar.typingTV becomeFirstResponder];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.toolbar setHidden:YES];
    [self.toolbar.typingTV endEditing:YES];
}

-(void)setupToolBar
{
    CGFloat toolbarX=0;
    CGFloat toolbarH=40;
    CGFloat toolbarY=self.view.frame.size.height-20;
    CGFloat toolbarW=self.view.frame.size.width;
    
    IMChatToolBar* toolbar=[[IMChatToolBar alloc]init];
    toolbar.frame=CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
    [self.navigationController.view addSubview:toolbar];
    toolbar.delegate=self;
    self.toolbar=toolbar;
    
//    [JWNotificationCenter addObserver:self selector:@selector(DidTextchanged) name:UITextViewTextDidChangeNotification object:toolbar.typingTV];
    
    [JWNotificationCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [JWNotificationCenter addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chatDataArray.count;
}



-(void)keyboardWillShow:(NSNotification*)note
{
    CGRect keyboardF = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect frame=keyboardF;
    frame.size.height+=40;
    keyboardF=frame;
    
    // 2.取出键盘弹出的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 3.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.toolbar.transform = CGAffineTransformMakeTranslation(0, -keyboardF.size.height+40);
    }];
}


-(void)keyboardWillHide:(NSNotification*)note
{
    CGFloat duration=[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.toolbar.transform=CGAffineTransformIdentity;
    }];
}
-(void)toobarComposeBtnClick:(IMChatToolBar *)toolbar
{
    IMChatData* data=[[IMChatData alloc]init];
    data.chatContent=self.toolbar.typingTV.text;
    [self.chatDataArray addObject:data];
    self.toolbar.typingTV.text=@"";
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IMChatCell* cell=[[IMChatCell alloc]init];
    cell.data=self.chatDataArray[indexPath.row];
    
    return cell;
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
