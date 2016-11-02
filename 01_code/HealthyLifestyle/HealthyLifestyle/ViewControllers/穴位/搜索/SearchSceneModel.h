//
//  MessageSceneModel.h
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "HLSceneModel.h"
#import "AcupointModel.h"

@protocol SearchSceneModelDelegate;

@interface SearchSceneModel : HLSceneModel

@property (nonatomic, strong) NSMutableArray<AcupointModel *> * acupointList;
@property (nonatomic, weak) id<SearchSceneModelDelegate> delegate;

- (void)queryAcupointsWithKeyword:(NSString *)keyword;

@end

@protocol SearchSceneModelDelegate <NSObject>

- (void)searchSceneModelDidQueryAcupoints;

@end
