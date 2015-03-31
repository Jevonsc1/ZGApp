//
//  ZGBookDetailComCell.m
//  ZGApp
//
//  Created by Jevons on 15/3/31.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGBookDetailComCell.h"

@implementation ZGBookDetailComCell

+(instancetype)initWithTableView:(UITableView*)tableView
{
    static  NSString  *ID = @"Jevons";
    ZGBookDetailComCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc]init];
 //       NSArray* nibs=[[NSBundle mainBundle]loadNibNamed:@"ZGBookDetailComCell" owner:nil options:nil];
//        cell=[nibs lastObject];
        cell.icon.image=[UIImage imageNamed:@"menubar_setting"];
        cell.author.text=@"郑泓硕";
        cell.commonSchool.layer.cornerRadius=2.0;
        cell.date.text=@"昨天";
        cell.content.text=@"努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评努力凑够4行书评";
        [cell.zanNum setTitle:@"33" forState:UIControlStateNormal];
        
        [cell.comNum setTitle:@"99" forState:UIControlStateNormal];
        
        
    }
    return cell;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
     
        
        }
    return self;
}

@end
