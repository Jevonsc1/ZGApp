//
//  IMCacheCell.m
//  ZGApp
//
//  Created by Jevons on 15/1/20.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "IMCacheCell.h"
#define cellH  80
#define margin  0

@implementation IMCacheCell

+(instancetype)initWithTableView:(UITableView *)tableView
{
    static NSString* ID=@"imcell";
    IMCacheCell* cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[IMCacheCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
-(void)setModel:(imCacheData *)model
{
    self.textLabel.text=model.name;
    self.textLabel.textAlignment=NSTextAlignmentCenter;
    self.textLabel.font=[UIFont systemFontOfSize:20];
    
    self.imageView.image=[UIImage imageNamed:model.icon];
    
    self.detailTextLabel.text=model.message;
    self.detailTextLabel.font=[UIFont systemFontOfSize:15];
    self.detailTextLabel.textColor=[UIColor grayColor];
    
    self.date=model.date;
    
    self.cellHight=cellH;
    
    CGPoint point=self.textLabel.center;
    point.y=margin+self.textLabel.frame.size.height*0.5;
    self.textLabel.center=point;
    
    point.y=2*point.y;
    self.detailTextLabel.center=point;
    
    
    
}

-(void)setDate:(NSString *)date
{
    _date=[date copy];
    UILabel* label=[[UILabel alloc]init];
    label.text=_date;
    label.textColor=[UIColor grayColor];
    label.font=[UIFont systemFontOfSize:14];
    CGSize labelSize=[_date sizeWithFont:[UIFont systemFontOfSize:14]];
    CGFloat labelX=self.frame.size.width-labelSize.width-10;
    CGFloat labelY=20;
    label.frame=(CGRect){{labelX,labelY},labelSize};

    [self addSubview:label];
    
    
}

@end
