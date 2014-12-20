//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCollectionAssembly.h"
#import "MESRecipeCollection.h"
#import "TLIndexPathController.h"


@implementation MESRecipeCollectionAssembly

- (NSArray *)britishRecipes {
    return @[@"Roast turkey", @"Pie and mash", @"Fish and chips"];
}

- (MESRecipeCollection *)defaultCollection {
    return [TyphoonDefinition withClass:[MESRecipeCollection class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithRecipes:)
                        parameters:^(TyphoonMethod *initializer) {
                            [initializer injectParameterWith:[self britishRecipes]];
                        }];
    }];
}

- (TLIndexPathController *)freshIndexPathControllerForViewControllerInitalization {
    return [TyphoonDefinition withClass:[TLIndexPathController class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopePrototype;
    }];
}

//- (MESRecipeCollection *)japaneseRecipes {
//    return [TyphoonDefinition withClass:[MESRecipeCollection class] configuration:^(TyphoonDefinition *definition) {
//        [definition useInitializer:@selector(initWithRecipes:)
//                        parameters:^(TyphoonMethod *initializer) {
//                            [initializer injectParameterWith:@[@"Salmon nigiri", @"Okononmiyaki", @"Beef udon", @"Chicken Teriyaki"]];
//                        }];
//    }];
//}

@end