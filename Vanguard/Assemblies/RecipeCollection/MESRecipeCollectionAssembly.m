//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCollectionAssembly.h"


@implementation MESRecipeCollectionAssembly

// We want to set up a reactive list, set up by

- (NSArray *)liveRecipeCollection {
    return @[@"Recipe A", @"Recipe B", @"Recipe C"];
}

- (NSArray *)recipes {
    return @[@"Recipe A", @"Recipe B", @"Recipe C"];
}

@end