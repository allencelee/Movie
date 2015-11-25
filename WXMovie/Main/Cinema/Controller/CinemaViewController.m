//
//  CinemaViewController.m
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaTableView.h"
#import "CinemaModel.h"
#import "CinemaCell.h"
#import "DistrictModel.h"
@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    CinemaModel *Cmodel;
    
    DistrictModel *Dmodel;
    
    NSMutableArray *dArr;
    
    NSMutableArray *cArr;
    
    NSArray *districtArr;
    
    NSArray *cinemaArr;
    
    NSMutableDictionary *cinemaDicSort;
    NSDictionary *districtDic;
    
    BOOL flag[30];
    
}
@end
@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadData];
    
    [self creatUI];
    
}

-(void)loadData{

    //加载位置数据
    districtDic = [BaseJsonData requestJsonDataFromName:@"district_list"];
//    
//    dArr = [[NSMutableArray alloc]init];
//    
    districtArr = districtDic[@"districtList"];
//
//    for (NSDictionary *dic in districtArr) {
//        
//        Dmodel = [[DistrictModel alloc]initWithDic:dic];
//        
//        [dArr addObject:Dmodel];
//        
//    }
    
    //加载影院数据
    
    NSDictionary *cinemaDic = [BaseJsonData requestJsonDataFromName:@"cinema_list"];
    
    cArr = [[NSMutableArray alloc]init];
    
    cinemaArr = cinemaDic[@"cinemaList"];
    
    for (NSDictionary *dic in cinemaArr) {
        
        Cmodel = [[CinemaModel alloc]initWithDic:dic];
        
        [cArr addObject:Cmodel];
        
    }
    
    //影院分组
    
    cinemaDicSort = [[NSMutableDictionary alloc]init];
    
    
    for (NSDictionary *dic in cinemaArr) {
        
        CinemaModel *model = [[CinemaModel alloc]initWithDic:dic];
        
        NSString *districtId = model.districtId;
        
        NSMutableArray *mArr = [cinemaDicSort objectForKey:districtId];
        
        if (mArr==nil) {
            
            mArr = [[NSMutableArray alloc]init];
            
            [cinemaDicSort setObject:mArr forKey:districtId];
            
        }
        
        [mArr addObject:model];
        
    }
    
}

-(void)creatUI{

    [_myTableView registerNib:[UINib nibWithNibName:@"CinemaCell" bundle:nil] forCellReuseIdentifier:@"CinemaCell"];

    _myTableView.rowHeight = 100;
    
    _myTableView.backgroundColor = [UIColor clearColor];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (!flag[section]) {
        
        return 0;
    }
    
    NSString *districtId =[districtArr[section] objectForKey:@"id"];
    
    NSArray *arr = [cinemaDicSort objectForKey:districtId];
    
    return arr.count;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return districtArr.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    static NSString *identify = @"headerView";
    
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identify];
    
    if (!headerView) {
        
        headerView = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:identify];
        headerView.frame=CGRectMake(0, 0, kScreenWidth, 44);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        [button setFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        
        [button setBackgroundImage:[UIImage imageNamed:@"hotMovieBottomImage@2x"] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = 100;
        
        [headerView.contentView addSubview:button];
    }
    headerView.tag = 200+section;

    NSDictionary *dic = districtArr[section];
    
    UIButton *but = (UIButton *)[headerView.contentView viewWithTag:100];
    
     [but setTitle:dic[@"name"] forState:UIControlStateNormal];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 44;
}

-(void)buttonAction:(UIButton *)button{

    UIView *sup = button.superview.superview;
    
    NSInteger section = sup.tag-200;
    
    flag[section] = !flag[section];
    
    NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:section];
    
    [_myTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaCell" forIndexPath:indexPath];
    
    NSDictionary *dic = districtArr[indexPath.section];
    
    NSString *districId = dic[@"id"];
    
    NSArray *arr = [cinemaDicSort objectForKey:districId];
    
    
    cell.model = arr[indexPath.row];
    
    
    
    
//    NSMutableArray *newArr = [[NSMutableArray alloc]init];
//    
//    for (CinemaModel *model in cArr) {
//        
//        if ([model.districtId isEqualToString:districtArr[indexPath.row][@"id"]]) {
//            
//            
//            cell.model = model;
//            
////            [newArr addObject:model];
//        }
//        
//        
//    }
    
    
    
    
    return cell;
}

@end
