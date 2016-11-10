//
//  MessageSceneModel.h
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "HLSceneModel.h"
#import "AcupointModel.h"

@protocol AcupointListSceneModelDelegate;

@interface AcupointListSceneModel : HLSceneModel

@property (nonatomic, strong) NSMutableArray<AcupointModel *> * acupointList;
@property (nonatomic, weak) id<AcupointListSceneModelDelegate> delegate;

- (void)queryAcupointsWithMeridianID:(NSString *)meridianID;
- (void)queryAcupointsWithPositionID:(NSString *)positionID;
- (void)queryAcupointsWithFunctionID:(NSString *)functionID;

@end

@protocol AcupointListSceneModelDelegate <NSObject>

- (void)acupointListSceneModelDidQueryAcupoints;

@end
