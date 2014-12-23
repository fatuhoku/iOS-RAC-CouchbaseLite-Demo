//
// Created by Hok Shun Poon on 22/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Typhoon/TyphoonAutoInjection.h>
#import <TLIndexPathTools/TLIndexPathDataModel.h>
#import "MESRecipeCollectionPresenter.h"
#import "MESRecipeCollectionInteractor.h"

@interface MESRecipeCollectionPresenter ()
@property(nonatomic, strong) InjectedClass(MESRecipeCollectionInteractor) interactor;
@end

@implementation MESRecipeCollectionPresenter

- (void)typhoonDidInject {
    RAC(self, recipesDataModel) = [RACObserve(self, interactor.recipeEntities) map:^TLIndexPathDataModel *(NSArray *recipeEntities) {
        return [[TLIndexPathDataModel alloc] initWithItems:recipeEntities];
    }];
}

@end

@implementation MESRecipeCollectionPresenter (Commands)

- (void)createNewRecipe {
    [self.interactor createNewRecipe];
}

@end

