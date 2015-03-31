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
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *commonSchool;
@property (weak, nonatomic) IBOutlet UILabel *date;

@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIButton *comNum;
@property (weak, nonatomic) IBOutlet UIButton *zanNum;


@end

@implementation ZGBookDetailComCell

+(instancetype)initWithTableView:(UITableView*)tableView
{
    static  NSString  *ID = @"Jevons";
    ZGBookDetailComCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ZGBookDetailComCell alloc]init];
        UINib * nib = [UINib nibWithNibName:@"ZGBookDetailComCell" bundle:nil];
        if (nib==nil) {
            NSLog(@"wrong");
        }
        [tableView registerNib:nib forCellReuseIdentifier:ID];

//        cell=[nibs lastObject];
        cell.icon.image=[UIImage imageNamed:@"menubar_setting"];
//        cell.author.text=@"郑泓硕";
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
