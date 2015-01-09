//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <TLIndexPathTools/TLIndexPathController.h>
#import "MESRecipeCollectionAssembly.h"
#import "MESDataStore.h"


@implementation MESRecipeCollectionAssembly

- (TLIndexPathController *)indexPathController {
    return [TyphoonDefinition withClass:[TLIndexPathController class]];
}

#pragma mark - Recipes

- (NSArray *)britishRecipes {
    return @[@"Roast turkey", @"Pie and mash", @"Fish and chips"];
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