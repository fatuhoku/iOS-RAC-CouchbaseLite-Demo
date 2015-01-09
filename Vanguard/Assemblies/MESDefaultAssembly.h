//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/TyphoonAssembly.h>

@class MESRecipeCollectionViewCellPresenter;
@protocol MESRecipeEntity;


@interface MESDefaultAssembly : TyphoonAssembly
// Intended to be used by a Presenter to construct cell view models based on a recipe.
- (MESRecipeCollectionViewCellPresenter *)collectionViewCellPresenterForRecipe:(id <MESRecipeEntity>)recipe;
@end