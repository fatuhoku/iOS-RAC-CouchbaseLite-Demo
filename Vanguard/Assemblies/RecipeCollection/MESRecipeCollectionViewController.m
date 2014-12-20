//
//  MESRecipeCollectionViewController.m
//  Vanguard
//
//  Created by Hok Shun Poon on 19/12/2014.
//  Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Typhoon/TyphoonAutoInjection.h>
#import "MESRecipeCollectionViewController.h"
#import "MESRecipeCollectionViewModel.h"


@interface MESRecipeCollectionViewController ()
@property(nonatomic, strong) InjectedClass(MESRecipeCollectionViewModel) viewModel;
@end

@implementation MESRecipeCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    RAC(self, indexPathController.dataModel) = RACObserve(self, viewModel.dataModel);
}

@end
