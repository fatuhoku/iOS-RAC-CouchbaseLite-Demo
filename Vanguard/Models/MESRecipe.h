//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBLModel.h"

@class CBLQuery;


@interface MESRecipe : CBLModel
@property(nonatomic, copy) NSString *title;

+ (NSString *)docType;

// List specific views here; these are exactly the views the application needs to maintain.
+ (CBLQuery *)allRecipesQueryWithDatabase:(CBLDatabase *)database;
@end