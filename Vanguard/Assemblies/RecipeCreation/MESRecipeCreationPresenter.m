//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MESRecipeCreationPresenter.h"
#import "MESRecipe.h"


@implementation MESRecipeCreationPresenter

- (instancetype)init {
    self = [super init];
    if (self) {
        RAC(self, textToDisplay) = [RACObserve(self, model.text) map:^(NSString *name) {
            return [NSString stringWithFormat:@"Let's cook %@!", name];
        }];
    }

    return self;
}

@end