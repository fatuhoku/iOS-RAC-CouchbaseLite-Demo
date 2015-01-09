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


@interface MESRecipeCollectionViewController () <TLIndexPathControllerDelegate>
@property(nonatomic, strong) InjectedClass(MESRecipeCollectionPresenter)presenter;
@end

@implementation MESRecipeCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSAssert(self.presenter, @"presenter is nil");
    self.presenter.indexPathController.delegate = self;
    self.tableView.dataSource = self.presenter;
}


#pragma mark - Action

- (IBAction)didTouchUpInsideCreateNewRecipeButton:(id)sender {
    [self.presenter createNewRecipe];
}

#pragma mark - Table View Delegate

- (void)controller:(TLIndexPathController *)controller didUpdateDataModel:(TLIndexPathUpdates *)updates {
    [updates performBatchUpdatesOnTableView:self.tableView withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
