//
//  ZGTagsCell.m
//  ZGApp
//
//  Created by Jevons on 15/2/7.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGTagsCell.h"
#import "UIImage+TB.h"
#define tagsCellGap 10

@interface ZGTagsCell()
@property(nonatomic,weak)UILabel* tagsLabel;
@property(nonatomic,strong)NSMutableArray* btnArray;

@end

@implementation ZGTagsCell
-(NSMutableArray *)btnArray
{
    if (_btnArray==nil) {
        _btnArray=[NSMutableArray array];
    }
    return _btnArray;
}
+(instancetype)cellWithTable:(UITableView *)tableView
{
//    static NSString* ID=@"Tags";
//    ZGTagsCell* cell=[tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell==nil) {
//        cell=[[ZGTagsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
//
    ZGTagsCell* cell=[[ZGTagsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    return cell;
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel* tagsLabel=[[UILabel alloc]init];
        
        tagsLabel.font=[UIFont systemFontOfSize:17];
        [self addSubview:tagsLabel];
        self.tagsLabel=tagsLabel;
        
       
        
    }
    return self;
}

-(void)setTags:(ZGTags *)tags{
    _tags=tags;
    CGSize tagsLabelSize=[self.tags.tagTitle sizeWithFont:[UIFont systemFontOfSize:17]];
    CGFloat tagsLabelY=(SearchTagCellHeight-tagsLabelSize.height)*0.5;
    self.tagsLabel.frame=CGRectMake(20, tagsLabelY, tagsLabelSize.width, tagsLabelSize.height);
    self.tagsLabel.text=tags.tagTitle;
    
    
    
    for (int i=0; i<self.tags.tagArray.count; i++) {
        UIButton* tagBtn=[[UIButton alloc]init];
        [tagBtn setTitle:self.tags.tagArray[i] forState:UIControlStateNormal];
        [tagBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [tagBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        tagBtn.font=[UIFont systemFontOfSize:15];
//        [tagBtn setBackgroundImage:[UIImage resizedImageWithName:@"btn3"] forState:UIControlStateNormal];
        [self addSubview:tagBtn];
        [self.btnArray addObject:tagBtn];
    }
    
    CGFloat tagsBtnW=(self.frame.size.width-CGRectGetMaxX(self.tagsLabel.frame)-4*tagsCellGap)/3.0;
    CGFloat tagsBtnH=(SearchTagCellHeight-4*tagsCellGap)/3.0;
    for (int i=0; i<self.tags.tagArray.count; i++) {
        CGFloat tagsBtnX=i%3*(tagsBtnW+tagsCellGap)+CGRectGetMaxX(self.tagsLabel.frame)+tagsCellGap;
        CGFloat tagsBtnY=i/3*(tagsBtnH+tagsCellGap)+tagsCellGap;
        
        
        UIButton* btn=self.btnArray[i];
        btn.frame=CGRectMake(tagsBtnX, tagsBtnY, tagsBtnW, tagsBtnH);
        
        btn.layer.cornerRadius=tagsBtnH*0.5;
        btn.layer.borderWidth=0.5;
        btn.layer.borderColor=[UIColor grayColor].CGColor;
        
    }
    
}
-(void)btnClick:(UIButton*)btn
{
    if ([self.delegate respondsToSelector:@selector(tagscell:withBtnTitle:)]) {
        [self.delegate tagscell:self withBtnTitle:btn.titleLabel.text];
    }
}
@end
