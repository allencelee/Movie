//
//  myImageViewController.m
//  WXMovie
//
//  Created by imac on 15/10/23.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "myImageViewController.h"

@interface myImageViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{
  NSMutableArray *modelArr;  
}
@end

static NSString *identify = @"collCell";
@implementation myImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //1.加载数据
    
    [self loadData];
    //2.创建视图
    
    [self creatUI];

    
}

-(void)loadData{

    NSArray *imageArr =[BaseJsonData requestJsonDataFromName:@"image_list"];
    
    modelArr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in imageArr) {
        imageModel *model = [[imageModel alloc]init];
        model.image = dic[@"image"];
        
        [modelArr addObject:model];
    }
    

    
}

-(void)creatUI{

    _myCollectionViewFlowLayout.minimumInteritemSpacing = 15;
    _myCollectionViewFlowLayout.minimumLineSpacing = 15;
    _myCollectionViewFlowLayout.itemSize = CGSizeMake(100, 75);
    _myCollectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    //注册
//    [_myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identify];
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 40;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    imageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(32)/32.0 green:arc4random_uniform(32)/32.0 blue:arc4random_uniform(32)/32.0 alpha:1];
    
    
    cell.layer.cornerRadius = 10;
    cell.layer.masksToBounds = YES;
    
    cell.model = modelArr[indexPath.row];

    return cell;

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
//选中单元格代理方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    PhotoViewController *photoViewC = [[PhotoViewController alloc]init];
    
    photoViewC.data = modelArr;
    
    photoViewC.indexPath = indexPath;
    
//    BaseNavigationController *navigation = [[BaseNavigationController alloc]initWithRootViewController:photoViewC];
    
    [self.navigationController pushViewController:photoViewC animated:YES];
   
}


@end
