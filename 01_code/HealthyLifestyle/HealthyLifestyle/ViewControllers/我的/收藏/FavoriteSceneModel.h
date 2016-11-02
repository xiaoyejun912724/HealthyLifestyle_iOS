//
//  MessageSceneModel.h
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "HLSceneModel.h"
#import "AcupointModel.h"

@protocol FavoriteSceneModelDelegate;

@interface FavoriteSceneModel : HLSceneModel

@property (nonatomic, strong) NSMutableArray<AcupointModel *> * acupointList;
@property (nonatomic, weak) id<FavoriteSceneModelDelegate> delegate;

- (void)queryAcupointsWithIDList:(NSArray *)idList;

@end

@protocol FavoriteSceneModelDelegate <NSObject>

- (void)favoriteSceneModelDidQueryAcupoints;

@end
