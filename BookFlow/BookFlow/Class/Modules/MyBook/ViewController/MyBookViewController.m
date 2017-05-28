//
//  MyBookViewController.m
//  BookFlow
//
//  Created by chenlong on 2017/5/28.
//  Copyright © 2017年 chenlong. All rights reserved.
//

#import "MyBookViewController.h"
#import "BookCollectionCell.h"
#import "BookDetailViewController.h"

@interface MyBookViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation MyBookViewController {
    UICollectionView *_collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的书库";
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

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UICollectionViewDatasource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BookCollectionCell* cell = (BookCollectionCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"BookCollectionCell" forIndexPath:indexPath];
    
    return cell;
}
#pragma mark - <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
