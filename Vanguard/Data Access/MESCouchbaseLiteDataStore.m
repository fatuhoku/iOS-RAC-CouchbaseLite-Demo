//
// Created by Hok Shun Poon on 22/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <couchbase-lite-ios/CBLManager.h>
#import <couchbase-lite-ios/CBLDatabase.h>
#import <couchbase-lite-ios/CBLQuery.h>
#import "MESCouchbaseLiteDataStore.h"
#import "MESUtils.h"
#import "CBLLiveQuery+ReactiveCouchbaseLite.h"
#import "MESRecipe.h"


@interface MESCouchbaseLiteDataStore ()
@property(nonatomic, strong) CBLDatabase *database;
@end

@implementation MESCouchbaseLiteDataStore

- (instancetype)init {
    self = [super init];
    if (self) {
        NSError *error;
        self.database = [[CBLManager sharedInstance] databaseNamed:@"vanguard" error:&error];
        [MESUtils assertNoError:error];
    }
    return self;
}

- (RACSignal *)allRecipes {
    CBLQuery *allRecipesQuery = [self.database createAllDocumentsQuery];
    return [allRecipesQuery.asLiveQuery rcl_rows];
}

- (id <MESRecipeEntity>)createNewRecipeWithTitle:(NSString *)title {
    MESRecipe *newRecipe = [[MESRecipe alloc] initWithNewDocumentInDatabase:self.database];
    newRecipe.type = [MESRecipe docType];
    newRecipe.title = title;

    NSError *error;
    [newRecipe save:&error];
    [MESUtils assertNoError:error];
    return newRecipe;
}

@end