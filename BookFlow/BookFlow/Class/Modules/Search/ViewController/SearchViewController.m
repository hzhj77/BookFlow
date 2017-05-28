//
//  SearchViewController.m
//  BookFlow
//
//  Created by chenlong on 2017/5/27.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController () <UISearchBarDelegate>

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //标题视图
    UIView* titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    
    UISearchBar* searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 130, 24)];
    searchBar.center = CGPointMake(searchBar.center.x, titleView.center.y + 3);
    searchBar.layer.cornerRadius = 15;
    searchBar.layer.masksToBounds = YES;
    searchBar.placeholder = @"搜搜想要的书吧~";
    searchBar.showsBookmarkButton = YES;
    searchBar.delegate = self;
    [titleView addSubview:searchBar];
    
    UIButton *cancle = [[UIButton alloc]initWithFrame:CGRectMake(searchBar.maxX + 10, 15, 30, 20)];
    [cancle setBackgroundImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [titleView addSubview:cancle];
    
    
    self.navigationItem.titleView = titleView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
