//
//  ZGMyBookListCell.m
//  ZGApp
//
//  Created by Jevons on 15/3/3.
//  Copyright (c) 2015年 Jevons. All rights reserved.
//

#import "ZGMyBookListCell.h"
#import "UIImageView+WebCache.h"

@implementation ZGMyBookListCell
-(void)setBooklist:(ZGBookList *)booklist
{
    [self.bookView setImageWithURL:[NSURL URLWithString:booklist.book.images.small] placeholderImage:[UIImage imageNamed:@"book_blank"]];
    self.bookName.text=booklist.book.title;
    self.bookAuthor.text=booklist.book.author;
    if (booklist.bookstatus==1) {
        [self.selectBtn setSelected:NO];
        self.btnStatus.text=@"不供借阅";
    }
    else{
        [self.selectBtn setSelected:YES];
        self.btnStatus.text=@"供借阅";
    }
    
}
- (void)awakeFromNib {
    self.userInteractionEnabled=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnSelect:(id)sender {
//    [sender setSelected:YES];
}
@end
