//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCollectionViewModel.h"
#import "MESRecipeCollection.h"
#import "TLIndexPathDataModel.h"


@interface MESRecipeCollectionViewModel ()
@property(nonatomic, strong) InjectedClass(MESRecipeCollection) recipeCollection;
@end

@implementation MESRecipeCollectionViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        // RAC Bindings
        RAC(self, dataModel) = [RACObserve(self, recipeCollection) map:^(MESRecipeCollection *collection) {
            return [[TLIndexPathDataModel alloc] initWithItems:collection.recipes];
        }];
    }
    return self;
}

@end