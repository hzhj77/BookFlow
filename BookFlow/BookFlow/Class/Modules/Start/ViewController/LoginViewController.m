//
//  LoginViewController.m
//  BookFlow
//
//  Created by chenlong on 2017/5/26.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "LoginViewController.h"
#import "WSLoginView.h"
#import "MainViewController.h"
#import "CLNavigationController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    WSLoginView *wsLoginV = [[WSLoginView alloc]initWithFrame:self.view.bounds];
    wsLoginV.titleLabel.text = @"书遇";
    wsLoginV.titleLabel.textColor = [UIColor whiteColor];
    wsLoginV.titleLabel.font = [UIFont systemFontOfSize:20 weight:10];
    wsLoginV.hideEyesType = AllEyesHide;
    [self.view addSubview:wsLoginV];
    
    [wsLoginV setClickBlock:^(NSString *textField1Text, NSString *textField2Text) {
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogined"];
        
        MainViewController *mainVC = [[MainViewController alloc]init];
        CLNavigationController *naviVC = [[CLNavigationController alloc]initWithRootViewController:mainVC];
        [self presentViewController:naviVC animated:YES completion:nil];
        
    }];
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
