//
// Created by Hok Shun Poon on 22/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/TyphoonAutoInjection.h>
#import "MESRecipeCollectionPresenter.h"

@class MESRecipeCollectionInteractor;

@interface MESRecipeCollectionPresenter (CommandsProperties)
@property(nonatomic, strong) InjectedClass(MESRecipeCollectionInteractor) interactor;
@end

@implementation MESRecipeCollectionPresenter (CommandsProperties)
@dynamic interactor;
@end
