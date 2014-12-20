//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MESRecipeCollectionViewModel.h"
#import "MESRecipe.h"


@implementation MESRecipeCollectionViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        // RAC Bindings
        NSAssert(self.outputModel, @"outputModel not available");
    }
    return self;
}

@end