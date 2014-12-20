//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCollectionAssembly.h"
#import "MESRecipeCollection.h"


@implementation MESRecipeCollectionAssembly

- (MESRecipeCollectionViewCellViewModel *)

- (NSArray *)britishRecipes {
    return [TyphoonDefinition withClass:[MESRecipeCollection class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithRecipes:)
                        parameters:^(TyphoonMethod *initializer) {
                            [initializer injectParameterWith:@[@"Roast turkey", @"Pie and mash", @"Fish and chips"]];
                        }];
    }];
}

- (NSArray *)japaneseRecipes {
    return [TyphoonDefinition withClass:[MESRecipeCollection class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithRecipes:)
                        parameters:^(TyphoonMethod *initializer) {
                            [initializer injectParameterWith:@[@"Salmon nigiri", @"Okononmiyaki", @"Beef udon", @"Chicken Teriyaki"]];
                        }];
    }];
}

@end