//
//  BookCollectionCell.m
//  BookFlow
//
//  Created by chenlong on 2017/5/28.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "BookCollectionCell.h"



@implementation BookCollectionCell {
    UIImageView *cover;
    UILabel *title;
    UILabel *author;
    UIImageView *change;
    UILabel *changeTimes;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        cover = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cellWidth, cellWidth * 1.2)];
        cover.image = [UIImage imageNamed:@"22.jpeg"];
        [self.contentView addSubview:cover];
        
        UIView *mask = [[UIView alloc]initWithFrame:CGRectMake(0, cellWidth, cellWidth, cellWidth * 0.2)];
        mask.backgroundColor = [UIColor blackColor];
        mask.alpha = 0.3;
        [self.contentView addSubview:mask];
        
        title = [[UILabel alloc]initWithFrame:CGRectMake(10, cellWidth * 1.02, cellWidth - 20, cellWidth * 0.16)];
        title.font = [UIFont systemFontOfSize:14];
        title.textColor = [UIColor whiteColor];
        title.text = @"《这是一本书》";
        title.textAlignment = UITextAlignmentCenter;
        [self.contentView addSubview:title];
        
        author = [[UILabel alloc]initWithFrame:CGRectMake(10, cover.maxY, cellWidth - 20, cellWidth * 0.15)];
        author.text = @"顶顶顶顶 著";
        author.font = [UIFont systemFontOfSize:11];
        author.textColor = [UIColor grayColor];
        author.textAlignment = UITextAlignmentCenter;
        [self.contentView addSubview:author];
        
        change = [[UIImageView alloc] initWithFrame:CGRectMake(cellWidth / 2 - cellWidth * 0.12, author.maxY + cellWidth * 0.015, cellWidth * 0.12, cellWidth * 0.12)];
        change.image = [UIImage imageNamed:@"timeline_G"];
        [self.contentView addSubview:change];
        
        changeTimes = [[UILabel alloc]initWithFrame:CGRectMake(cellWidth / 2, author.maxY, 40, cellWidth * 0.15)];
        changeTimes.text = @"12";
        changeTimes.font = [UIFont systemFontOfSize:11];
        changeTimes.textColor = [UIColor grayColor];
        [self.contentView addSubview:changeTimes];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
