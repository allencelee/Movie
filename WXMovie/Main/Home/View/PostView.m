//
//  PostView.m
//  WXMovie
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "PostView.h"
#import "PostCollectionView.h"
#import "PostCell.h"
#import "HeaderCollectionView.h"
@implementation PostView

{

    UIButton *button;
    UIControl *mask;
    PostCollectionView *postCollectionV;
    HeaderCollectionView *headerListView;
    HomeModel *model;
    UILabel *title;
}

-(void)awakeFromNib{
    
}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self creatHeaderView];
        [self creatCollectionView];
        [self initHeaderListView];
        [self addLight];
        
        [headerListView addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionNew context:nil];
        
        [postCollectionV addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    
    return  self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{

    int page = [change[@"new"] intValue];
 
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:page inSection:0];
    
    if (object==headerListView&&postCollectionV.currentPage != page) {
        
        postCollectionV.currentPage = page;
        
        [postCollectionV scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        model = _jsonArray[page];
        title.text = model.title;
    }
    if (object == postCollectionV&&headerListView.currentPage!=page) {
        
        headerListView.currentPage = page;
        
        [headerListView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        model = _jsonArray[page];
        title.text = model.title;
    }
    
}

-(void)initHeaderListView{

    headerListView = [[HeaderCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    
    headerListView.itemWidth = 75;
    
    [_headerView addSubview:headerListView];
    
    
    
}

-(void)creatCollectionView{
    
    postCollectionV = [[PostCollectionView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, self.height-30-35)];
    postCollectionV.itemWidth=0.75*kScreenWidth;
    
//    postCollectionV.pagingEnabled = YES;   不好使
    
    [self addSubview:postCollectionV];
    
    [self sendSubviewToBack:postCollectionV];
}

-(void)setJsonArray:(NSArray *)jsonArray{

    _jsonArray = jsonArray;
    postCollectionV.jsonArray = _jsonArray;
    
    headerListView.jsonArray = _jsonArray;
    
    model = [[HomeModel alloc]init];
    
    model = _jsonArray[0];
    
    [self addLable];

}

-(void)creatHeaderView{

    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, -100, kScreenWidth, 130)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, 130)];
    
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    
    imageView.image = newImage;
    
    [_headerView addSubview:imageView];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:CGRectMake((kScreenWidth-10)/2, 130-20, 15, 15)];
    
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    
    [_headerView addSubview:button];
    button.tag = 100;
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_headerView];
    
    [self creatMaskControl];
    
}

#pragma mark - 创建滑动手势
-(void)creatSwipeGestureRecognizer{

    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipAction)];
    
    swip.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self addGestureRecognizer:swip];
}
-(void)swipAction{
    
    [self showHeaderView];
}

#pragma mark - 创建遮罩视图
-(void)creatMaskControl{
    
    [self creatSwipeGestureRecognizer];

    mask = [[UIControl alloc]initWithFrame:self.bounds];
    
    mask.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    mask.hidden = YES;
    
    [self addSubview:mask];
    
    [self insertSubview:mask belowSubview:_headerView];
    
    [mask addTarget:self action:@selector(maskAction) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)maskAction{

    [self hideHeaderview];
}


-(void)clickAction:(UIButton *)but{

    if (!button.selected) {
        
        [self showHeaderView];
        
    }else{
    
        [self hideHeaderview];
        
    }
}

-(void)showHeaderView{

    [UIView animateWithDuration:0.35 animations:^{
        _headerView.transform = CGAffineTransformMakeTranslation(0, 100);
    }];
    
    button.selected = YES;
    
    mask.hidden = NO;
}

-(void)hideHeaderview{

    [UIView animateWithDuration:0.35 animations:^{
        _headerView.transform = CGAffineTransformIdentity;
    }];
    
    button.selected = NO;
    mask.hidden = YES;
}

-(void)addLight{
    
    
    UIImageView *lightView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"light"]];
    
    [lightView setFrame:CGRectMake(70, 15, 100, 100)];
    
    UIImageView *lightView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"light"]];
    
    [lightView2 setFrame:CGRectMake(230, 15, 100, 100)];
    
    [self addSubview:lightView];
    
    [self addSubview:lightView2];
    
    [self insertSubview:lightView belowSubview:_headerView];
    
    [self insertSubview:lightView2 belowSubview:_headerView];
    
}
-(void)addLable{

    title = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height-35, kScreenWidth, 40)];
    
    title.text = model.title;
    
    title.textColor = [UIColor whiteColor];
    
    title.font = [UIFont systemFontOfSize:20];
    
    title.textAlignment = NSTextAlignmentCenter;
    
    title.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    
    [self addSubview:title];
}
@end
