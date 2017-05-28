//
//  BookDetailViewController.m
//  BookFlow
//
//  Created by chenlong on 2017/5/27.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "BookDetailViewController.h"
#import "BookDetailView.h"
#import "CommentCell.h"


@interface BookDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation BookDetailViewController {
    UITableView *tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详情";
    tableView = [[UITableView alloc]initWithFrame:ScreenFrame style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [tableView setSeparatorInset:UIEdgeInsetsMake(0, 38, 0, 0)];
        
    }
    
    BookDetailView *headerView = [[BookDetailView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 300)];
    tableView.tableHeaderView = headerView;
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
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    if (!cell) {
        cell = [[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
    }
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
    return 200;
}

#pragma mark - <UITableViewDelegate>

@end
