//
//  FollowCell.m
//  BookFlow
//
//  Created by chenlong on 2017/5/27.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "FollowCell.h"

@implementation FollowCell {
    UIImageView *_avatar;
    UILabel *_nameLabel;
    UIImageView *_gender;
    UILabel *_intro;
    UIButton *_set;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _avatar = [[UIImageView alloc]initWithFrame:CGRectMake(14, 10, 50, 50)];
        _avatar.image = [UIImage imageNamed:@"book.jpg"];
        _avatar.layer.cornerRadius = 25;
        _avatar.layer.masksToBounds = YES;
        [self.contentView addSubview:_avatar];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _nameLabel.text = @"hzhj";
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.adjustsFontSizeToFitWidth = YES;
        _nameLabel.textAlignment=NSTextAlignmentCenter;
        CGSize sizeThatFit=[_nameLabel sizeThatFits:CGSizeZero];
        _nameLabel.frame=CGRectMake(_avatar.maxX + 10, 15, sizeThatFit.width, sizeThatFit.height);
        [self.contentView addSubview:_nameLabel];
     
        _gender = [[UIImageView alloc]initWithFrame:CGRectMake(_nameLabel.maxX + 5, 17, 15, 15)];
        _gender.image = [UIImage imageNamed:@"book.jpg"];
        [self.contentView addSubview:_gender];
        
        _intro = [[UILabel alloc]initWithFrame:CGRectMake(_nameLabel.x, 40, ScreenWidth - _nameLabel.x - 45, 15)];
        _intro.textColor = [UIColor lightGrayColor];
        _intro.font = [UIFont systemFontOfSize:12];
        _intro.text = @"这个人很懒，什么都没留下";
        [self.contentView addSubview:_intro];
        
        _set = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 40, 28, 30, 15)];
        [_set setBackgroundImage:[UIImage imageNamed:@"me"] forState:UIControlStateNormal];
        [self.contentView addSubview:_set];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
