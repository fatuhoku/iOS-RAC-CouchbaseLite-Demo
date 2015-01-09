//
// Created by Hok Shun Poon on 22/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCollectionViewCellPresenter.h"
#import "MESRecipeEntity.h"


@interface MESRecipeCollectionViewCellPresenter ()
@property(nonatomic, readwrite) NSString *title;
@end

@implementation MESRecipeCollectionViewCellPresenter

- (instancetype)initWithRecipe:(id <MESRecipeEntity>)recipe {
    self = [super init];
    if (self != nil) {
        self.title = recipe.title;
    }
    return self;    
}

@end