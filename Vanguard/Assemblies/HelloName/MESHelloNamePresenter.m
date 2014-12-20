//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MESHelloNamePresenter.h"
#import "MESRecipe.h"


@implementation MESHelloNamePresenter

- (instancetype)init {
    self = [super init];
    if (self) {
        RAC(self, textToDisplay) = [RACObserve(self, model.text) map:^(NSString *name) {
            return [NSString stringWithFormat:@"Hello, %@", name];
        }];
    }

    return self;
}

@end