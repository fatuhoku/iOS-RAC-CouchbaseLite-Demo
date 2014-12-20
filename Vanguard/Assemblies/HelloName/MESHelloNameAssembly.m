//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESHelloNameAssembly.h"
#import "MESName.h"
#import "MESHelloNameInteractor.h"


@implementation MESHelloNameAssembly

- (MESHelloNameInteractor *)interactor {
    return [TyphoonDefinition withClass:[MESHelloNameInteractor class]];
}

- (MESName *)storyboardModel {
    return [TyphoonDefinition withClass:[MESName class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeWeakSingleton;
                          }];
}

@end