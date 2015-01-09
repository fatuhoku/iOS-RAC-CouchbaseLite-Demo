//
// Created by Hok Shun Poon on 22/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLIndexPathDataModel;


// Let viewModels be fetched lazily as cells are created. Do not ever be eager about
// creating these view models.
@interface MESRecipeCollectionPresenter : NSObject <UITableViewDataSource>
@property(nonatomic, strong) TLIndexPathController *indexPathController;
@end

@interface MESRecipeCollectionPresenter (Commands)
- (void)createNewRecipe;
@end
