//
//  MESNameOutputViewController.m
//  Vanguard
//
//  Created by Hok Shun Poon on 19/12/2014.
//  Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MESNameOutputViewController.h"
#import "MESHelloNamePresenter.h"

@interface MESNameOutputViewController ()
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation MESNameOutputViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    RAC(self, nameLabel.text) = RACObserve(self, presenter.textToDisplay);
}

@end
