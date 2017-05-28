//
//  BookDetailView.m
//  BookFlow
//
//  Created by chenlong on 2017/5/28.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "BookDetailView.h"

@implementation BookDetailView {
    UIImageView *cover;
    UILabel *title;
    UILabel *author;
    UILabel *owner;
    UIImageView *avatar;
    UILabel *nameLabel;
    UILabel *contact;
    UIView *line;
    UILabel *intro;
    UIView *gray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        cover = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 100, 125)];
        cover.image = [UIImage imageNamed:@"book.jpg"];
        [self addSubview:cover];
        
        
        title = [[UILabel alloc]initWithFrame:CGRectMake(135, 20, ScreenWidth - 150, 0)];
        NSString *text = @"书名队出书名队出书名";
        NSAttributedString *arrtribute = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
        CGRect nameRect = [arrtribute boundingRectWithSize:CGSizeMake(ScreenWidth - 150, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        title.height = nameRect.size.height;
        title.text = text;
        title.numberOfLines = 0;
        title.font = [UIFont boldSystemFontOfSize:20];
        [self addSubview:title];
        
        author = [[UILabel alloc]initWithFrame:CGRectMake(135, title.maxY + 10, ScreenWidth - 150, 0)];
        NSAttributedString *authorArrtribute = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        CGRect authorRect = [authorArrtribute boundingRectWithSize:CGSizeMake(ScreenWidth - 150, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        author.height = authorRect.size.height;
        author.text = text;
        author.numberOfLines = 0;
        author.font = [UIFont systemFontOfSize:14];
        [self addSubview:author];
        
        owner = [[UILabel alloc]initWithFrame:CGRectMake(135, author.maxY + 15, 60, 15)];
        owner.text = @"拥有者:";
        owner.font = [UIFont systemFontOfSize:14];
        owner.textColor = [UIColor grayColor];
        [self addSubview:owner];
        
        avatar = [[UIImageView alloc]initWithFrame:CGRectMake(owner.maxX, author.maxY + 12, 20, 20)];
        avatar.image = [UIImage imageNamed:@"book.jpg"];
        avatar.layer.cornerRadius = 10;
        avatar.layer.masksToBounds = YES;
        [self addSubview:avatar];
        
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(avatar.maxX + 5, author.maxY + 15, ScreenWidth - 20 - avatar.maxX, 15)];
        nameLabel.text = @"黄鼠狼";
        nameLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:nameLabel];
        
        contact = [[UILabel alloc]initWithFrame:CGRectMake(135, owner.maxY + 10, ScreenWidth - 150, 15)];
        contact.text = @"QQ: 242222222";
        contact.font = [UIFont systemFontOfSize:14];
        contact.textColor = [UIColor grayColor];
        [self addSubview:contact];
        
        CGFloat lineTop = contact.maxY > 135 ? contact.maxY + 10 : 145;
        line = [[UIView alloc]initWithFrame:CGRectMake(20, lineTop, ScreenWidth - 40, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        
        NSString *introText = @"1977年12月，他们录制了4首新歌，渐渐的Joy Division的名气越来越大，1979年4月14日，乐队出现在了英国国家电台上，他们很快就被公众所熟悉。这些成功让他们整个夏天和秋季都在伦敦的酒吧里演出。";
        intro = [[UILabel alloc]initWithFrame:CGRectMake(20, lineTop + 15, ScreenWidth - 40, 0)];
        NSAttributedString *introAtt = [[NSAttributedString alloc]initWithString:introText attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
        CGRect introRect = [introAtt boundingRectWithSize:CGSizeMake(ScreenWidth - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        intro.height = introRect.size.height;
        intro.font = [UIFont systemFontOfSize:14];
        intro.text = introText;
        intro.numberOfLines = 0;
        [self addSubview:intro];
        
        gray = [[UIView alloc]initWithFrame:CGRectMake(0, intro.maxY + 5, ScreenWidth, 15)];
        gray.backgroundColor = [UIColor getColorByRed:230 green:230 blue:230];
        [self addSubview:gray];
    }
    return self;
}

@end
