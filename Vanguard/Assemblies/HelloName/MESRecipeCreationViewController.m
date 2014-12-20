//
//  MESRecipeCreationViewController.m
//  Vanguard
//
//  Created by Hok Shun Poon on 19/12/2014.
//  Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MESRecipeCreationViewController.h"
#import "MESRecipeCreationPresenter.h"

@interface MESRecipeCreationViewController ()
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation MESRecipeCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    RAC(self, nameLabel.text) = RACObserve(self, presenter.textToDisplay);
}

@end
