//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "TLIndexPathController.h"
#import "MESRecipeCollectionAssembly.h"
#import "MESSharedAssembly.h"


@implementation MESSharedAssembly

- (TLIndexPathController *)freshIndexPathControllerForViewControllerInitalization {
    return [TyphoonDefinition withClass:[TLIndexPathController class] configuration:^(TyphoonDefinition *definition) {
        definition.scope = TyphoonScopePrototype;
    }];
}

@end