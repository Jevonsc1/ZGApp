//
//  JWSendController.m
//  JeWeibo
//
//  Created by Jevons on 14/12/23.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "ZGSendController.h"
#import "ZGTextview.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"

#import "ZGSendPhotosView.h"
#import "ZGHttpTool.h"


#define ZGNotificationCenter [NSNotificationCenter defaultCenter]
@interface ZGSendController ()<UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,weak)ZGTextview* textView;
@property(nonatomic,weak)ZGSendPhotosView* imageView;
@end

@implementation ZGSendController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self setupNavBar];
    [self setupTextview];

    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.navigationItem.rightBarButtonItem.enabled=NO;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
}
-(void)setupImageView
{
    ZGSendPhotosView* imageview=[[ZGSendPhotosView alloc]init];
    CGFloat imageW=self.view.frame.size.width;
    CGFloat imageH=self.view.frame.size.height;
    CGFloat imageY=80;
    imageview.frame=CGRectMake(0,imageY,imageW,imageH);
    [self.textView addSubview:imageview];
    self.imageView=imageview;
}
-(void)setupTextview
{
    ZGTextview* textview=[[ZGTextview alloc]init];
    textview.frame=self.view.bounds;
    textview.placeholder=@"请写你的书评";
    textview.font=[UIFont systemFontOfSize:15];
    textview.delegate=self;
    textview.alwaysBounceVertical=YES;
    [self.view addSubview:textview];
    self.textView=textview;
    [ZGNotificationCenter addObserver:self selector:@selector(DidTextchanged) name:UITextViewTextDidChangeNotification object:textview];
    
}



-(void)DidTextchanged
{
    self.navigationItem.rightBarButtonItem.enabled=self.textView.text.length;
}
-(void)dealloc
{
    [ZGNotificationCenter removeObserver:self];
}
-(void)setupNavBar
{
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    
    
}
-(void)send
{
    if (self.imageView.totalNumberOfPhoto.count) {
//        [self sendWithImage];
    }else{
    [self sendWithoutImage];
    }
}

     
-(void)sendWithoutImage
{
 
  [self dismissViewControllerAnimated:YES completion:nil];
}
     
-(void)cancel
{
    [self.textView endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
     
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.textView endEditing:YES];
}
     
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
