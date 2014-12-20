//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAutoInjection.h"

@class MESName;


// Interactor houses the injected singleton MESName...
@interface MESHelloNameInteractor : NSObject
@property(nonatomic, strong) InjectedClass(MESName) name;
@end