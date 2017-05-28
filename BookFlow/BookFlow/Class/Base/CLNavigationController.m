//
//  CLNavigationController.m
//  bilibili fake
//
//  Created by chenlong on 2017/5/26.
//  Copyright © 2017年 云之彼端. All rights reserved.
//

#import "CLNavigationController.h"
#import "UINavigationBar+BackgroundColor.h"

@interface CLNavigationController ()

@end

@implementation CLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.backgroundColor = [UIColor getColorByRed:255 green:248 blue:177];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
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
