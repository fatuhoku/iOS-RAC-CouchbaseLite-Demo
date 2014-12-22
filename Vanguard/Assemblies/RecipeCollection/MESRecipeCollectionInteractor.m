//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCollectionInteractor.h"
#import "MESDataStore.h"


@interface MESRecipeCollectionInteractor ()
@property(nonatomic, strong) InjectedProtocol(MESDataStore) dataStore;
@end

@implementation MESRecipeCollectionInteractor

- (void)typhoonDidInject {
    NSLog(@"The datastore I got: %@", self.dataStore);
    RAC(self, recipeEntities) = [[self.dataStore allRecipes] doNext:^(id thing){
        NSLog(@"RECIPES RETRIEVED: %@", thing);
    }];
}

@end