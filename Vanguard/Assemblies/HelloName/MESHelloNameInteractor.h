//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAutoInjection.h"

@class MESRecipe;


// Interactor houses the injected singleton MESRecipe...
@interface MESHelloNameInteractor : NSObject
@property(nonatomic, strong) InjectedClass(MESRecipe) outputModel;
@end