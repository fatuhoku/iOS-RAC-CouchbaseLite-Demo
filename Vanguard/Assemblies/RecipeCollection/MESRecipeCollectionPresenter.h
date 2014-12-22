//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAutoInjection.h"

@class MESRecipeCollection;
@class TLIndexPathDataModel;

// Presenter houses the injected singleton MESRecipeCollection...
@interface MESRecipeCollectionPresenter : NSObject
@property(nonatomic, strong) TLIndexPathDataModel *dataModel;
@end