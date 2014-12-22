//
// Created by Hok Shun Poon on 22/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MESDataStore <NSObject>
@property(nonatomic, strong) RACSignal *allRecipes;
@end