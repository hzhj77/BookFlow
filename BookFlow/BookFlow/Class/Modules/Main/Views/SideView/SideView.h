//
//  SideView.h
//  BookFlow
//
//  Created by chenlong on 2017/5/27.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *avatarImgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postButton;
@property (weak, nonatomic) IBOutlet UILabel *historyButton;
@property (weak, nonatomic) IBOutlet UILabel *myBookButton;
@property (weak, nonatomic) IBOutlet UILabel *logoutButton;


@property (copy, nonatomic) void (^clickInfo)();
@property (copy, nonatomic) void (^clickOnMenu)(NSInteger index);
@end
