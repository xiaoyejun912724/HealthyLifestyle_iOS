//
//  MessageSceneModel.h
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "HLSceneModel.h"
#import "MeridianModel.h"

@protocol MeridianListSceneModelDelegate;

@interface MeridianListSceneModel : HLSceneModel

@property (nonatomic, strong) NSMutableArray<MeridianModel *> * meridianList;
@property (nonatomic, weak) id<MeridianListSceneModelDelegate> delegate;

- (void)queryMeridians;

@end

@protocol MeridianListSceneModelDelegate <NSObject>

- (void)meridianListSceneModelDidQueryMeridians;

@end
