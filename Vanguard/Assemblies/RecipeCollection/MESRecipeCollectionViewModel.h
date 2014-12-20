//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAutoInjection.h"

@class MESRecipeCollection;
@class TLIndexPathDataModel;

// Interactor houses the injected singleton MESRecipeCollection...
@interface MESRecipeCollectionViewModel : NSObject
@property(nonatomic, strong) TLIndexPathDataModel *dataModel;
@end