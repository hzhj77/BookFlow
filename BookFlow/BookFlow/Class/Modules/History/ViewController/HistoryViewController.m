//
//  HistoryViewController.m
//  BookFlow
//
//  Created by chenlong on 2017/5/27.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryCell.h"
#import "BookDetailViewController.h"

@interface HistoryViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation HistoryViewController {
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的足迹";
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
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCell"];
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"HistoryCell" bundle:nil] forCellReuseIdentifier:@"HistoryCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    BookDetailViewController *bookDetailVC = [[BookDetailViewController alloc]init];
    [self.navigationController pushViewController:bookDetailVC animated:YES];
}

@end
