//
//  ZGMyTagCell.m
//  ZGApp
//
//  Created by Jevons on 15/3/6.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGMyTagCell.h"
#import "UIImage+TB.h"
#define tagGap 10
@interface ZGMyTagCell()


@property(nonatomic,strong)NSMutableArray* btnArray;

@property(nonatomic,assign)CGFloat taglength;
@property(nonatomic,assign)CGFloat taghight;
@end

@implementation ZGMyTagCell

-(void)setTagArray:(NSArray *)tagArray
{
    _tagArray=tagArray;
//    
    UIImageView* myimageView=[[UIImageView alloc]init];
    myimageView.image=[UIImage imageNamed:@"page_messagescenter_book"];
    self.myimageView=myimageView;
    [self.contentView addSubview:myimageView];
    
    UILabel* mylabel=[[UILabel alloc]init];
    mylabel.text=@"我的标签";
    self.mylabel=mylabel;
    [self.contentView addSubview:mylabel];
    
    for (int i=0; i<self.tagArray.count; i++) {
        
        NSString* string =[NSString stringWithFormat:@"%@    ",self.tagArray[i]];
        CGSize tagSize=[string sizeWithFont:[UIFont systemFontOfSize:23]];
        CGFloat tagX=0.0;
        CGFloat tagY=0.0;
        if (i == 0) {
            tagX=70;
            tagY=50;
        }
        else{
            if ((tagSize.width+self.taglength+tagGap)>(self.frame.size.width-tagX)) {
                tagX=70;
                tagY=self.taghight+tagGap;
            }
            else
            {
                tagX=self.taglength+tagGap;
                tagY=self.taghight-tagSize.height;
            }
        }
        self.taglength=tagSize.width+tagX;
        self.taghight=tagSize.height+tagY;
    
        
        UIButton* btn=[[UIButton alloc]init];
        [btn setTitle:self.tagArray[i] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage resizedImageWithName:@"btn3"] forState:UIControlStateNormal];
        btn.frame=CGRectMake(tagX, tagY, tagSize.width, tagSize.height);
        [btn setFont:[UIFont systemFontOfSize:15]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.layer.cornerRadius=tagSize.height*0.5;
        btn.layer.borderWidth=0.5;
        btn.layer.borderColor=[UIColor grayColor].CGColor;
        [self.contentView addSubview:btn];
        
        
        if (i==self.tagArray.count-1) {
            self.cellHeight=CGRectGetMaxY(btn.frame)+10;
        }
    }

    
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.myimageView.frame=CGRectMake(10, 10, 50, 50);
    self.mylabel.frame=CGRectMake(70, 10, 150, 40);
    
}
@end
