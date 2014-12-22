//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/TyphoonAssembly.h>

@class MESRecipeCellViewModel;
@protocol MESRecipeEntity;


@interface MESSharedAssembly : TyphoonAssembly
- (MESRecipeCellViewModel *)recipeCollectionCellViewModelForRecipe:(id <MESRecipeEntity>)recipe;
@end