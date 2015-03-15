//
//  TBTabBarButtton.m
//  TestBooking
//
//  Created by Jevons on 14/12/17.
//  Copyright (c) 2014年 Jevons. All rights reserved.
//

#import "TBTabBarButtton.h"
#define JWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@implementation TBTabBarButtton
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.imageView.contentMode=UIViewContentModeCenter;
        self.adjustsImageWhenHighlighted=NO;
        [self setTitleColor:JWColor(66, 181, 247) forState:UIControlStateNormal];
    }
    return self;
}
-(void)setHidden:(BOOL)hidden{
    
}
-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
}
@end
