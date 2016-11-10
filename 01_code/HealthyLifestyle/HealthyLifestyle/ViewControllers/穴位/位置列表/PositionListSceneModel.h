//
//  MessageSceneModel.h
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "HLSceneModel.h"
#import "PositionModel.h"

@protocol PositionListSceneModelDelegate;

@interface PositionListSceneModel : HLSceneModel

@property (nonatomic, strong) NSMutableArray<PositionModel *> * positionList;
@property (nonatomic, weak) id<PositionListSceneModelDelegate> delegate;

- (void)queryPositions;

@end

@protocol PositionListSceneModelDelegate <NSObject>

- (void)positionListSceneModelDidQueryPositions;

@end
