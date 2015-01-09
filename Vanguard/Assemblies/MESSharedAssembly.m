//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESCouchbaseLiteDataStore.h"
#import "MESDataStore.h"
#import "TLIndexPathController.h"
#import "MESSharedAssembly.h"
#import "MESRecipeCollectionViewCellPresenter.h"
#import "MESRecipeEntity.h"


@implementation MESSharedAssembly

#pragma mark - Cell View Models

- (MESRecipeCollectionViewCellPresenter *)collectionViewCellPresenterForRecipe:(id <MESRecipeEntity>)recipe {
    return [TyphoonDefinition withClass:[MESRecipeCollectionViewCellPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithRecipe:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:recipe];
        }];
    }];
}

#pragma mark - Data Store

- (id <MESDataStore>)defaultDatastore {
    return [TyphoonDefinition withClass:[MESCouchbaseLiteDataStore class]];
}

#pragma mark - TLIndexPathTools

- (TLIndexPathController *)indexPathController {
    return [TyphoonDefinition withClass:[TLIndexPathController class]];
}

@end