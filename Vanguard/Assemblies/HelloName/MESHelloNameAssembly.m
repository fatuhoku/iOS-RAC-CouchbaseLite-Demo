//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESHelloNameAssembly.h"
#import "MESRecipe.h"


@implementation MESHelloNameAssembly

// This is what will carry the name over to the outputViewController.
- (MESRecipe *)nameModelThatIsEffectivelyPassedBetweenViewControllers {
    return [TyphoonDefinition withClass:[MESRecipe class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeWeakSingleton;
                          }];
}

@end