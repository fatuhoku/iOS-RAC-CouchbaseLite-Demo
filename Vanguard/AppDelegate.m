//
//  AppDelegate.m
//  Vanguard
//
//  Created by Hok Shun Poon on 19/12/2014.
//  Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <couchbase-lite-ios/CBLQuery.h>
#import "AppDelegate.h"
#import "CBLDatabase.h"
#import "CBLManager.h"
#import "MESRecipe.h"
#import "MESUtils.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Just GET the database, and run something on it.
    NSError *error;
    CBLDatabase *database = [[CBLManager sharedInstance] databaseNamed:@"vanguard" error:&error];
    [MESUtils assertNoError:error];

    NSAssert(database, @"Database is nil");

    // Query for all documents...
    CBLQuery *allQuery = [database createAllDocumentsQuery];
    CBLQueryEnumerator *allResults = [allQuery run:&error];
    [MESUtils assertNoError:error];

    NSLog(@"Database has %u documents in it...", allResults.count);

    CBLQuery *query = [MESRecipe queryInDatabase:database];
    CBLQueryEnumerator *results = [query run:&error];
    [MESUtils assertNoError:error];

    NSLog(@"of which %u are recipes", results.count);
    
    if (results.count == 0) {
        NSLog(@"Creating a recipe and saving it...");

        MESRecipe *newRecipe = [[MESRecipe alloc] initWithNewDocumentInDatabase:database];
        newRecipe.type = [MESRecipe docType];
        newRecipe.title = @"Demo recipe";
        [newRecipe save:&error];
        [MESUtils assertNoError:error];
    } else {
        NSLog(@"There are some recipes... %@", results);
    }

    if (error) {
        NSLog(@"Error encountered: %@", error);
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
