//
//  BookScanViewController.m
//  ZGApp
//
//  Created by Jevons on 15/1/20.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "BookScanViewController.h"
#import "ZBarSDK.h"
#import "ZGBookDetailController.h"
#import "AFNetworking.h"
#import "BookInfo.h"
#import "MJExtension.h"
#import "ZGBook.h"
#import "ZGBookDetailFrame.h"

@interface BookScanViewController ()<ZBarReaderDelegate>
@property(nonatomic,weak)UIImageView* imageView;
@property(nonatomic,weak)UILabel* label;



@end

@implementation BookScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*0.5)];
//    imageView.backgroundColor=[UIColor redColor];
    self.imageView=imageView;
    
    UILabel* label=[[UILabel alloc]init];
    label.center=CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height*0.6);
    label.bounds=CGRectMake(0, 0, 90, 25);
    label.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:label];
    self.label=label;
    
    UIButton* btn=[[UIButton alloc]init];
    [btn setTitle:@"Scan" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.center=CGPointMake(self.view.frame.size.width*0.5, self.view.frame.size.height*0.7);
    btn.bounds=CGRectMake(0, 0, 70, 40);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:imageView];
    [self.view addSubview:btn];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
}
-(void)btnClick
{
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentModalViewController: reader
                            animated: YES];
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    
    // EXAMPLE: do something useful with the barcode data
    self.label.text = symbol.data;
    
    // EXAMPLE: do something useful with the barcode image
    self.imageView.image =
    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissModalViewControllerAnimated: YES];
    [self GetBookNum:symbol.data];
   
}
-(void)GetBookNum:(NSString*)booknum
{
    AFHTTPRequestOperationManager* mgr=[AFHTTPRequestOperationManager manager];
    NSString* str=[NSString stringWithFormat:@"https://api.douban.com/v2/book/isbn/%@",booknum];
    [mgr GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        ZGBook* book=[ZGBook objectWithKeyValues:responseObject];
        ZGBookDetailFrame* DetailFrame=[[ZGBookDetailFrame alloc]init];
        DetailFrame.book=book;
        
        NSArray* ary=responseObject[@"author"];
        if(ary.count==0)
        {
            book.author=@"";
        }else{
            book.author=ary[0];
        }
        
        ZGBookDetailController* vc=[[ZGBookDetailController alloc]init];
        vc.TopDetailFrame=DetailFrame;
        
        
        [self.navigationController pushViewController:vc animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


@end
