//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "TLIndexPathController.h"
#import "MESRecipeCollectionAssembly.h"
#import "MESSharedAssembly.h"
#import "MESRecipeCellViewModel.h"
#import "MESRecipeEntity.h"


@implementation MESSharedAssembly

#pragma mark - Cell View Models

- (MESRecipeCellViewModel *)recipeCellModelForRecipe:(id <MESRecipeEntity>)recipe {
    return [TyphoonDefinition withClass:[MESRecipeCellViewModel class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithRecipe:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:recipe];
        }];
    }];
}

#pragma mark - TLIndexPathTools

- (TLIndexPathController *)freshIndexPathControllerForViewControllerInitalization {
    return [TyphoonDefinition withClass:[TLIndexPathController class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopePrototype;
    }];
}

@end