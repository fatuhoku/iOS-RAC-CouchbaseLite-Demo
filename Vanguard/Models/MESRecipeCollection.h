//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MESRecipeCollection : NSObject
@property(nonatomic, strong) NSArray *recipes;

- (instancetype)initWithRecipes:(NSArray *)recipes;
@end