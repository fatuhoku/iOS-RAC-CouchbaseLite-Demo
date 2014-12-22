//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCollectionAssembly.h"
#import "MESDataStore.h"
#import "MESCouchbaseLiteDataStore.h"


@implementation MESRecipeCollectionAssembly

- (NSArray *)britishRecipes {
    return @[@"Roast turkey", @"Pie and mash", @"Fish and chips"];
}

- (id <MESDataStore>)defaultDatastore {
    return [TyphoonDefinition withClass:[MESCouchbaseLiteDataStore class]];
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