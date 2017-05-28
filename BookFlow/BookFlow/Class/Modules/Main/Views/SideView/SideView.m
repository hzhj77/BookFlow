//
//  SideView.m
//  BookFlow
//
//  Created by chenlong on 2017/5/27.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "SideView.h"

@implementation SideView


- (void)awakeFromNib {
    [super awakeFromNib];
    _avatarImgV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapOnAvatar = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoPersonalInfo)];
    [_avatarImgV addGestureRecognizer:tapOnAvatar];
    _nameLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapOnNameLabel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoPersonalInfo)];
    [_nameLabel addGestureRecognizer:tapOnNameLabel];
    
    
    _postButton.userInteractionEnabled = YES;
    _postButton.tag = 0;
    UITapGestureRecognizer *postClickGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [_postButton addGestureRecognizer:postClickGR];

    _historyButton.userInteractionEnabled = YES;
    _historyButton.tag = 1;
    UITapGestureRecognizer *historyClickGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [_historyButton addGestureRecognizer:historyClickGR];
    
    _myBookButton.userInteractionEnabled = YES;
    _myBookButton.tag = 2;
    UITapGestureRecognizer *myBookClickGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [_myBookButton addGestureRecognizer:myBookClickGR];

    
    _logoutButton.userInteractionEnabled = YES;
    _logoutButton.tag = 3;
    UITapGestureRecognizer *logoutClickGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    [_logoutButton addGestureRecognizer:logoutClickGR];
}

- (void)gotoPersonalInfo {
    self.clickInfo();
}

- (void)click:(UITapGestureRecognizer *)recognizer {
    UIView *view = recognizer.view;
    self.clickOnMenu(view.tag);
}

@end
