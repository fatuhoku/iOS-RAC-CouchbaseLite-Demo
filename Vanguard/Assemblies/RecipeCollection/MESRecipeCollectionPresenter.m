//
// Created by Hok Shun Poon on 22/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCellViewModel.h"
#import "MESSharedAssembly.h"
#import "MESRecipeCollectionViewController.h"
#import <Typhoon/TyphoonAutoInjection.h>
#import <TLIndexPathTools/TLIndexPathDataModel.h>
#import "MESRecipeCollectionPresenter.h"
#import "MESRecipeCollectionInteractor.h"

@interface MESRecipeCollectionPresenter ()
@property(nonatomic, strong) InjectedClass(MESSharedAssembly)assembly;
@property(nonatomic, strong) InjectedClass(MESRecipeCollectionInteractor)interactor;
@end

@implementation MESRecipeCollectionPresenter

- (void)typhoonDidInject {
    self.indexPathController = [TLIndexPathController new];

    RAC(self, indexPathController.dataModel) = [RACObserve(self, interactor.recipeEntities) map:^TLIndexPathDataModel *(NSArray *recipeEntities) {
        return [[TLIndexPathDataModel alloc] initWithItems:recipeEntities];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.indexPathController.dataModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:@"ruid_recipeCollectionViewCell" forIndexPath:indexPath];

    id recipe = [self.indexPathController.dataModel itemAtIndexPath:indexPath];
    [self configureCell:cell withModel:recipe];

    return cell;
}

- (void)configureCell:(UITableViewCell *)cell withModel:(id)recipe {
    MESRecipeCellViewModel *viewModel = [self.assembly recipeCollectionCellViewModelForRecipe:recipe];
    cell.textLabel.text = viewModel.title;
}
@end

@implementation MESRecipeCollectionPresenter (Commands)

- (void)createNewRecipe {
    [self.interactor createNewRecipe];
}

@end

