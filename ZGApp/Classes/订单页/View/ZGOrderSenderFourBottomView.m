//
//  ZGOrderSenderFourBottomView.m
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGOrderSenderFourBottomView.h"

@implementation ZGOrderSenderFourBottomView


- (IBAction)starView1:(id)sender {
    [self.starView1 setSelected:YES];
    [self.starView2 setSelected:NO];
    [self.starView3 setSelected:NO];
    [self.starView4 setSelected:NO];
    [self.starView5 setSelected:NO];
    
}

- (IBAction)starView2:(id)sender {
    [self.starView1 setSelected:YES];
    [self.starView2 setSelected:YES];
    [self.starView3 setSelected:NO];
    [self.starView4 setSelected:NO];
    [self.starView5 setSelected:NO];
}

- (IBAction)starView3:(id)sender {
    [self.starView1 setSelected:YES];
    [self.starView2 setSelected:YES];
    [self.starView3 setSelected:YES];
    [self.starView4 setSelected:NO];
    [self.starView5 setSelected:NO];
}

- (IBAction)starView4:(id)sender {
    [self.starView1 setSelected:YES];
    [self.starView2 setSelected:YES];
    [self.starView3 setSelected:YES];
    [self.starView4 setSelected:YES];
    [self.starView5 setSelected:NO];
}

- (IBAction)starView5:(id)sender {
    [self.starView1 setSelected:YES];
    [self.starView2 setSelected:YES];
    [self.starView3 setSelected:YES];
    [self.starView4 setSelected:YES];
    [self.starView5 setSelected:YES];
}

- (IBAction)ComfirmReturn:(id)sender {
    self.starView1.userInteractionEnabled=NO;
    self.starView2.userInteractionEnabled=NO;
    self.starView3.userInteractionEnabled=NO;
    self.starView4.userInteractionEnabled=NO;
    self.starView5.userInteractionEnabled=NO;
}
@end
