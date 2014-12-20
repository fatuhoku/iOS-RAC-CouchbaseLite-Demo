//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCollectionViewCellViewModel.h"
#import "MESRecipe.h"


@interface MESRecipeCollectionViewCellViewModel ()
@property(nonatomic, strong) MESRecipe *model;
@end

@implementation MESRecipeCollectionViewCellViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        // RAC Bindings
        RAC(self, recipeName) = RACObserve(self, model.name);
    }

    return self;
}

@end