//
//  FollowViewController.m
//  BookFlow
//
//  Created by chenlong on 2017/5/27.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "FollowViewController.h"
#import "FollowCell.h"

@interface FollowViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FollowViewController {
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"关注";
    _tableView = [[UITableView alloc]initWithFrame:ScreenFrame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FollowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FollowCell"];
    if (cell == nil) {
        cell = [[FollowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"groupFollowCellMemberCell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

#pragma mark - <UITableViewDelegate>


@end
