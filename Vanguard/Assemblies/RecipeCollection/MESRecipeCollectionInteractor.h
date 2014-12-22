//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAutoInjection.h"

@interface MESRecipeCollectionInteractor : NSObject
// Array of id <MESRecipeEntity>
@property(nonatomic, copy) NSArray *recipeEntities;
@end