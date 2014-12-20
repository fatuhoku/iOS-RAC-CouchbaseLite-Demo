//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <couchbase-lite-ios/CBLDatabase.h>
#import "MESRecipe.h"
#import "CBLQuery.h"


@implementation MESRecipe

@dynamic name;

+ (NSString *)docType {
    return @"MESRecipe";
}

+ (CBLQuery *)queryInDatabase:(CBLDatabase *)database {
    NSString *allRecipesViewName = @"MESRecipe.all";

    CBLView *view = [database viewNamed:allRecipesViewName];

    if (!view.mapBlock) {
        // Register the map function, the first time we access the view:
        [view setMapBlock:MAPBLOCK({
            if ([doc[@"type"] isEqualToString:[self docType]])
                emit(doc[@"title"], nil);
        })    reduceBlock:nil version:@"1"]; // bump version any time you change the MAPBLOCK body!
    }

    return [view createQuery];
}

@end