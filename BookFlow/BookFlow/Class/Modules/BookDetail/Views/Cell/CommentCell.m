//
//  CommentCell.m
//  BookFlow
//
//  Created by chenlong on 2017/5/28.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "CommentCell.h"
#import <Masonry.h>

@implementation CommentCell {
    UIView *lineView;
    UIImageView *circleView;
    UIImageView *avatar;
    UILabel *name;
    UILabel *comment;
    UIImageView *addressImg;
    UILabel *address;
    UILabel *timeLable;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSString *text = @"乐队出现在了英国国家电台上，他们很快就被公众所熟悉。这些成功让他们整个夏天和秋季都在伦敦的酒吧里演出乐队出现在了英国国家电台上，他们很快就被公众所";
        NSAttributedString *arrtribute = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        CGRect nameRect = [arrtribute boundingRectWithSize:CGSizeMake(ScreenWidth - 100, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        CGSize sizeOfComment = nameRect .size;
        self.height = sizeOfComment.height + 70;
        
        
        lineView = [[UIView alloc]initWithFrame:CGRectZero];
        lineView.backgroundColor = [UIColor getColorByRed:181 green:181 blue:181];
        [self.contentView addSubview:lineView];
        
        circleView = [[UIImageView alloc]initWithFrame:CGRectZero];
        circleView.image = [UIImage imageNamed:@"timeline_G"];
        [self.contentView addSubview:circleView];
        
        avatar = [[UIImageView alloc]initWithFrame:CGRectZero];
        avatar.image = [UIImage imageNamed:@"book.jpg"];
        avatar.layer.cornerRadius = 15;
        avatar.layer.masksToBounds = YES;
        [self.contentView addSubview:avatar];
        
        name = [[UILabel alloc]initWithFrame:CGRectZero];
        name.text = @"hzhj";
        name.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:name];
        
        comment = [[UILabel alloc]initWithFrame:CGRectZero];
        comment.text = text;
        comment.numberOfLines = 0;
        comment.font = [UIFont systemFontOfSize:14];
        comment.textColor = [UIColor getColorByRed:120 green:120 blue:120];
        [self.contentView addSubview:comment];
        
        addressImg = [[UIImageView alloc]initWithFrame:CGRectZero];
        addressImg.image = [UIImage imageNamed:@"address"];
        [self.contentView addSubview:addressImg];
        
        address = [[UILabel alloc]initWithFrame:CGRectZero];
        address.text = @"深圳";
        address.font = [UIFont systemFontOfSize:12];
        address.textColor = [UIColor grayColor];
        [self.contentView addSubview:address];
        
        timeLable = [[UILabel alloc]initWithFrame:CGRectZero];
        timeLable.text = @"2013-07";
        timeLable.textAlignment = UITextAlignmentRight;
        timeLable.textColor = [UIColor grayColor];
        timeLable.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:timeLable];
    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.width.equalTo(@1);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(20);

    }];
    [circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(avatar.mas_right).offset(10);
        make.centerY.equalTo(avatar.mas_centerY);
        make.height.equalTo(@16);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
    }];
    
    [comment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(80);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.top.equalTo(self.contentView.mas_top).offset(35);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-25);
    }];
    
    [addressImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@10);
        make.height.equalTo(@12);
        make.right.equalTo(address.mas_left).offset(-3);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-6);
    }];
    
    [address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-100);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        make.height.equalTo(@14);
        make.width.equalTo(@50);
    }];
    
    [timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-30);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        make.width.equalTo(@60);
        make.height.equalTo(@14);
    }];
    
}



@end
