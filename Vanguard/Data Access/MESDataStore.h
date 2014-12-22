//
// Created by Hok Shun Poon on 22/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MESRecipeEntity;

@protocol MESDataStore <NSObject>
// Nexts' NSArray of id <MESRecipeEntity>, updated live from live query
- (RACSignal *)allRecipes;

// Creates a recipe.
- (id <MESRecipeEntity>)createNewRecipeWithTitle:(NSString *)title;
@end