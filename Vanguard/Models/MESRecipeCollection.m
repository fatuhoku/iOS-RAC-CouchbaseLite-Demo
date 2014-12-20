//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MESRecipeCollection.h"


@implementation MESRecipeCollection

// Default collection.
- (instancetype)initWithRecipes:(NSArray *)recipes {
    self = [super init];
    if (self) {
        self.recipes = recipes;
    }
    return self;
}

@end