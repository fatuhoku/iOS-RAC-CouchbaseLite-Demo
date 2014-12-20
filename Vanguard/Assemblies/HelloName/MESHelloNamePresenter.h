//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TyphoonAutoInjection.h"

@class MESName;


@interface MESHelloNamePresenter : NSObject
@property (nonatomic, copy, readonly) NSString *textToDisplay;

@property (nonatomic, strong) InjectedClass(MESName) model;
@end