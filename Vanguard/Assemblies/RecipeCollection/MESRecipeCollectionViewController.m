//
//  MESRecipeCollectionViewController.m
//  Vanguard
//
//  Created by Hok Shun Poon on 19/12/2014.
//  Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Typhoon/TyphoonAutoInjection.h>
#import "MESRecipeCollectionViewController.h"
#import "MESRecipeCollectionPresenter.h"
#import "MESSharedAssembly.h"
#import "MESRecipeCellViewModel.h"


@interface MESRecipeCollectionViewController () <TLIndexPathControllerDelegate>
@property(nonatomic, strong) InjectedClass(MESSharedAssembly)assembly;
@property(nonatomic, strong) InjectedClass(MESRecipeCollectionPresenter)presenter;
@property(nonatomic, strong) InjectedClass(TLIndexPathController)indexPathController;
@end

@implementation MESRecipeCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.indexPathController.delegate = self;

    NSAssert(self.presenter, @"presenter is nil");

    // Can always ask the Presenter for individual view models.
    // TODO Is there a way that the Presenter can be aware of the indexPathController,
    // & handle the delegate method AND push updates to the view?
    // IndexPathController could
    RAC(self, indexPathController.dataModel) = RACObserve(self, presenter.recipesDataModel);
}

#pragma mark - Action

- (IBAction)didTouchUpInsideCreateNewRecipeButton:(id)sender {
    [self.presenter createNewRecipe];
}

#pragma mark - Table View Delegate

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

- (void)controller:(TLIndexPathController *)controller didUpdateDataModel:(TLIndexPathUpdates *)updates {
    [updates performBatchUpdatesOnTableView:self.tableView withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
