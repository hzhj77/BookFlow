//
//  MainViewController.m
//  BookFlow
//
//  Created by chenlong on 2017/5/26.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "MainViewController.h"
#import "BannerView.h"
//#import "BookFlowCell.h"
#import "BookCollectionCell.h"
#import "SideView.h"
#import "FollowViewController.h"
#import "BookDetailViewController.h"
#import "SearchViewController.h"
#import "PostBookViewController.h"
#import "MeViewController.h"
#import "HistoryViewController.h"
#import "LoginViewController.h"
#import "MyBookViewController.h"


@interface MainViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate> {
//    BannerView *_bannerView;
//    UITableView *_tableView;
    UICollectionView *_collectionView;
    SideView *_sideView;
    UIView* _maskView;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
}

- (void)setUI {
    //标题视图
    UIView* titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, 30, 30)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"me"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(showLeftView) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:leftButton];
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 46, 10, 30, 30)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:rightButton];
    
    UISearchBar* searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(leftButton.maxX + 10, 0, ScreenWidth - 100, 24)];
    searchBar.center = CGPointMake(searchBar.center.x, titleView.center.y + 3);
    searchBar.layer.cornerRadius = 15;
    searchBar.layer.masksToBounds = YES;
    searchBar.placeholder = @"搜搜想要的书吧~";
    searchBar.showsBookmarkButton = YES;
    searchBar.delegate = self;
    [titleView addSubview:searchBar];
    
    self.navigationItem.titleView = titleView;

    
    
    
//    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
//    _tableView.dataSource = self;
//    _tableView.delegate = self;
//    [self.view addSubview:_tableView];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(cellWidth, cellWidth * 1.5);
    layout.sectionInset = UIEdgeInsetsMake(15, 20, 18, 18);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:ScreenFrame collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor getColorByRed:230 green:230 blue:230];
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass: [BookCollectionCell class] forCellWithReuseIdentifier:@"BookCollectionCell"];
    [self.view addSubview:_collectionView];

    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CLBannerview"];
    
    
//    _bannerView = [[BannerView alloc] init];
//    _bannerView.frame = CGRectMake(0, 0, ScreenWidth, 170);
//    [_bannerView setOnClickBannerItem:^(NSUInteger index) {
//        NSLog(@"%ld", index);
//    }];
//    _bannerView.urls = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495826627874&di=43eb2c8a44cca74e60f10b5201d3cff2&imgtype=0&src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F6f315031db31d88c2c33ee8ba4ecf0bbef94d15a.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495824325891&di=85da8555491c130f4641236166fc612a&imgtype=0&src=http%3A%2F%2Fimg.9ku.com%2Fgeshoutuji%2Fsingertuji%2F5%2F5517%2F5517_4.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495824943445&di=fa9088ede536adc1c35ad7a0ac070a55&imgtype=0&src=http%3A%2F%2Fi.ebayimg.com%2F00%2Fs%2FNTM2WDc2OA%3D%3D%2Fz%2F7lYAAOxypNtSh45F%2F%2524_1.JPG%3Fset_id%3D880000500F"];
//    _tableView.tableHeaderView = _bannerView;

    
    _maskView = [[UIView alloc] initWithFrame:ScreenFrame];
    _maskView.backgroundColor = [UIColor blackColor];
    _maskView.alpha = 0;
    [_maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideMenu)]];
    [self.navigationController.view addSubview:_maskView];
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"SideView" owner:nil options:nil];;
    _sideView = [nibContents lastObject];
    _sideView.frame = CGRectMake(-250, 0, 250, ScreenHeight);
    __weak typeof(self) WeakSelf =  self;
    _sideView.clickInfo = ^(){
        [WeakSelf hideMenu];
        MeViewController *meVC = [[MeViewController alloc]init];
        [WeakSelf.navigationController pushViewController:meVC animated:YES];
    };
    _sideView.clickOnMenu = ^(NSInteger index) {
        switch (index) {
            case 0:{
                PostBookViewController *postVC = [[PostBookViewController alloc] init];
                [WeakSelf hideMenu];
                [WeakSelf.navigationController pushViewController:postVC animated:YES];
            }
                break;
            
            case 1:{
                HistoryViewController *historyVC = [[HistoryViewController alloc]init];
                [WeakSelf hideMenu];
                [WeakSelf.navigationController pushViewController:historyVC animated:YES];
            }
                break;
            case 2:{
                MyBookViewController *myBookViewController = [[MyBookViewController alloc]init];
                [WeakSelf hideMenu];
                [WeakSelf.navigationController pushViewController:myBookViewController animated:YES];
            }
                break;
                
            case 3:{
                LoginViewController *loginVC = [[LoginViewController alloc]init];
                [WeakSelf presentViewController:loginVC animated:YES completion:nil];
            }
                break;
                
            default:
                break;
        }
    };
    [self.navigationController.view addSubview:_sideView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UICollectionViewDatasource>
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(ScreenWidth, 150);
}

//这个也是最重要的方法 获取Header的 方法。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *CellIdentifier = @"CLBannerview";
    //从缓存中获取 Headercell
    UICollectionReusableView *view = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    BannerView *bannerView = [[BannerView alloc] init];
    bannerView.frame = CGRectMake(0, 0, ScreenWidth, 150);
    bannerView.urls = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495826627874&di=43eb2c8a44cca74e60f10b5201d3cff2&imgtype=0&src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F6f315031db31d88c2c33ee8ba4ecf0bbef94d15a.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495824325891&di=85da8555491c130f4641236166fc612a&imgtype=0&src=http%3A%2F%2Fimg.9ku.com%2Fgeshoutuji%2Fsingertuji%2F5%2F5517%2F5517_4.jpg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495824943445&di=fa9088ede536adc1c35ad7a0ac070a55&imgtype=0&src=http%3A%2F%2Fi.ebayimg.com%2F00%2Fs%2FNTM2WDc2OA%3D%3D%2Fz%2F7lYAAOxypNtSh45F%2F%2524_1.JPG%3Fset_id%3D880000500F"];
    [bannerView setOnClickBannerItem:^(NSUInteger index) {
        NSLog(@"%ld", index);
    }];
    [view addSubview:bannerView];
    return view;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BookCollectionCell* cell = (BookCollectionCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"BookCollectionCell" forIndexPath:indexPath];
    
    return cell;
}
#pragma mark - <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
        BookDetailViewController *bookDetailVC = [[BookDetailViewController alloc]init];
        [self.navigationController pushViewController:bookDetailVC animated:YES];
}

//#pragma mark - <UITableViewDatasource>
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 20;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    BookFlowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookFlowCell"];
//    if (cell == nil) {
//        [tableView registerNib:[UINib nibWithNibName:@"BookFlowCell" bundle:nil] forCellReuseIdentifier:@"BookFlowCell"];
//        cell = [tableView dequeueReusableCellWithIdentifier:@"BookFlowCell"];
//    }
//    return cell;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 140.0;
//}
//
//#pragma mark - <UITableViewDelegate>
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    BookDetailViewController *bookDetailVC = [[BookDetailViewController alloc]init];
//    [self.navigationController pushViewController:bookDetailVC animated:YES];
//}

#pragma mark - <UISearchBarDelegate>
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
    return NO;
}
#pragma mark - Actions
- (void)showLeftView {
    
    [UIView animateWithDuration:0.3 animations:^{
        _sideView.frame = CGRectMake(0, 0, 250, ScreenHeight);
        _maskView.alpha = 0.6;
    }];
    
}

- (void)select {
    
}


-(void)hideMenu{
    [UIView animateWithDuration:0.3 animations:^{
        _sideView.frame = CGRectMake(-250, 0, 250, ScreenHeight);
        _maskView.alpha = 0;
    }];
}

@end
