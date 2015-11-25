//
//  TopViewController.m
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "TopViewController.h"
#import "MoviewDetailViewController.h"
#define KItemCount 3
#define KItemWidth 100
#define KItemHeight 166
#define KItemSpace (kScreenWidth-KItemCount*KItemWidth)/(KItemCount+1)
@interface TopViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{

    NSMutableArray *dataArray;
}
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.加载数据
    [self loadData];
    //2.创建UI
    [self creatUI];
//    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(void)loadData{

    dataArray = [[NSMutableArray alloc]init];
    
    NSDictionary *DataDic = [BaseJsonData requestJsonDataFromName:@"top250"];
    
    NSArray *arr = DataDic[@"subjects"];
    
    for (NSDictionary *dic in arr) {
            TopModel *model = [[TopModel alloc]init];
            model.title = dic[@"title"];
            model.rating = dic[@"rating"];
            model.images = dic[@"images"];

            [dataArray addObject:model];
            
        
    }
}
-(void)creatUI{

    _myCollectionFlowLayOut.itemSize = CGSizeMake(100, 166);
    _myCollectionFlowLayOut.sectionInset = UIEdgeInsetsMake(KItemSpace, KItemSpace, KItemSpace, KItemSpace) ;
    _myCollectionFlowLayOut.minimumInteritemSpacing=KItemSpace;
    _myCollectionFlowLayOut.minimumLineSpacing=KItemSpace;
    
   
    
}
#pragma mark - UIcollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopCell" forIndexPath:indexPath];
    cell.model = dataArray[indexPath.row];
    
    return cell;
    
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    MoviewDetailViewController *DetailViewC = [self.storyboard instantiateViewControllerWithIdentifier:@"MoviewDetailViewController"];
    DetailViewC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:DetailViewC animated:YES];
    
    
    
    
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
