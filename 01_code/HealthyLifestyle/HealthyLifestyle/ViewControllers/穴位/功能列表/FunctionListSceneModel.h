//
//  MessageSceneModel.h
//  ZhaoQiPei
//
//  Created by 找汽配 on 16/3/17.
//  Copyright © 2016年 祥运. All rights reserved.
//

#import "HLSceneModel.h"
#import "FunctionModel.h"

@protocol FunctionListSceneModelDelegate;

@interface FunctionListSceneModel : HLSceneModel

@property (nonatomic, strong) NSMutableArray<FunctionModel *> * functionList;
@property (nonatomic, weak) id<FunctionListSceneModelDelegate> delegate;

- (void)queryFunctions;

@end

@protocol FunctionListSceneModelDelegate <NSObject>

- (void)functionListSceneModelDidQueryFunctions;

@end
