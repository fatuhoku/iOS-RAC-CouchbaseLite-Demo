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


@interface MESRecipeCollectionViewController () <TLIndexPathControllerDelegate>
@property(nonatomic, strong) InjectedClass(MESRecipeCollectionPresenter)presenter;
@property(nonatomic, strong) InjectedClass(TLIndexPathController) indexPathController;
@end

@implementation MESRecipeCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.indexPathController.delegate = self;

    NSAssert(self.presenter, @"presenter is nil");

    // Can always ask the Presenter for individual view models.
    RAC(self, indexPathController.dataModel) = RACObserve(self, presenter.recipesDataModel);
}

#pragma mark - Action

- (IBAction)didTouchUpInsideCreateNewRecipeButton:(id)sender {
    
}

#pragma mark - Table View Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.indexPathController.dataModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ruid_recipeCollectionViewCell" forIndexPath:indexPath];

    NSString *recipeName = [self.indexPathController.dataModel itemAtIndexPath:indexPath];
    [self configureCell:cell withModel:recipeName];

    return cell;
}

- (void)configureCell:(UITableViewCell *)cell withModel:(NSString *)recipeName {
    cell.textLabel.text = recipeName;
}

- (void)controller:(TLIndexPathController *)controller didUpdateDataModel:(TLIndexPathUpdates *)updates {
    [updates performBatchUpdatesOnTableView:self.tableView withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
