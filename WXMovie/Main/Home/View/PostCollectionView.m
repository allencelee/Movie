//
//  PostCollectionView.m
//  WXMovie
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "PostCollectionView.h"
#import "PostCell.h"
@implementation PostCollectionView

static NSString *identufy = @"PostCell";
-(instancetype)initWithFrame:(CGRect)frame {

    
    if (self = [super initWithFrame:frame ]) {
 
        [self registerClass:[PostCell class] forCellWithReuseIdentifier:identufy];
        
    }
    
    return self;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identufy forIndexPath:indexPath];
    
    cell.model = self.jsonArray [indexPath.row];
    
//    cell.backgroundColor = [UIColor redColor];
    
    return cell;

}


@end
