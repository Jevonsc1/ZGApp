//
//  ZGBookDetailComCell.m
//  ZGApp
//
//  Created by Jevons on 15/3/31.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBookDetailComCell.h"

@interface ZGBookDetailComCell (){
    
}


@end

@implementation ZGBookDetailComCell

+(instancetype)initWithTableView:(UITableView*)tableView
{
    static  NSString  *ID = @"Jevons";
    ZGBookDetailComCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        ZGBookDetailComCell *cell=[[ZGBookDetailComCell alloc]init];
//    }
    
    return cell;
}

-(void)setComment:(ZGBookComment *)comment{
    _comment=comment;
    self.comSchoolLabel.layer.cornerRadius=10.0f;
    self.icon.layer.cornerRadius=15;
    self.icon.image=[UIImage imageNamed:@"menubar_setting"];
    self.icon.backgroundColor=[UIColor blackColor];
    //        cell.author.text=@"郑泓硕";
    
    self.author.text=@"郑泓硕";
    self.dateLabel.text=@"昨天";
    self.content.text=@"努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评";
    [self.zanBtn setTitle:@"33" forState:UIControlStateNormal];
    [self.zanBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [self.comBtn setTitle:@"33" forState:UIControlStateNormal];
    [self.comBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
     
        
        }
    return self;
}

@end
