//
//  ZGOrderSenderFourBottomView.h
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGOrderSenderFourBottomView : UIView
@property (weak, nonatomic) IBOutlet UIButton *starView1;
@property (weak, nonatomic) IBOutlet UIButton *starView2;
@property (weak, nonatomic) IBOutlet UIButton *starView3;
@property (weak, nonatomic) IBOutlet UIButton *starView4;
@property (weak, nonatomic) IBOutlet UIButton *starView5;
- (IBAction)starView1:(id)sender;

- (IBAction)starView2:(id)sender;
- (IBAction)starView3:(id)sender;
- (IBAction)starView4:(id)sender;
- (IBAction)starView5:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Contact;
@property (weak, nonatomic) IBOutlet UIButton *ComfirmReturn;

- (IBAction)ComfirmReturn:(id)sender;
@end
