//
// Created by Hok Shun Poon on 22/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCollectionViewCellPresenter.h"
#import "MESSharedAssembly.h"
#import "MESRecipeCollectionViewController.h"
#import <Typhoon/TyphoonAutoInjection.h>
#import <TLIndexPathTools/TLIndexPathDataModel.h>
#import "MESRecipeCollectionPresenter.h"
#import "MESRecipeCollectionInteractor.h"
#import "MESRecipeCollectionViewCell.h"

@interface MESRecipeCollectionPresenter ()
@property(nonatomic, strong) InjectedClass(MESSharedAssembly)assembly;
@property(nonatomic, strong) InjectedClass(MESRecipeCollectionInteractor)interactor;
@end

@implementation MESRecipeCollectionPresenter

- (void)typhoonDidInject {
    RAC(self, indexPathController.dataModel) = [RACObserve(self, interactor.recipeEntities) map:^TLIndexPathDataModel *(NSArray *recipeEntities) {
        return [[TLIndexPathDataModel alloc] initWithItems:recipeEntities];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.indexPathController.dataModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MESRecipeCollectionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ruid_recipeCollectionViewCell" forIndexPath:indexPath];

    id recipe = [self.indexPathController.dataModel itemAtIndexPath:indexPath];
    [self configureCell:cell withModel:recipe];

    return cell;
}

- (void)configureCell:(MESRecipeCollectionViewCell *)cell withModel:(id)recipe {
    MESRecipeCollectionViewCellPresenter *viewModel = [self.assembly collectionViewCellPresenterForRecipe:recipe];
    cell.viewModel = viewModel;
}

@end

@implementation MESRecipeCollectionPresenter (Commands)

- (void)createNewRecipe {
    [self.interactor createNewRecipe];
}

@end

