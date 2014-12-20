//
//  MESNameInputViewController.m
//  Vanguard
//
//  Created by Hok Shun Poon on 19/12/2014.
//  Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "MESNameInputViewController.h"
#import "MESName.h"
#import "MESHelloNameInteractor.h"
#import "TyphoonAutoInjection.h"


@interface MESNameInputViewController ()
@property(nonatomic, strong) IBOutlet UITextField *nameTextField;

@property(nonatomic, strong) InjectedClass(MESHelloNameInteractor)interactor;
@end

@implementation MESNameInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSAssert(self.nameTextField, @"textfield is nil");
    NSAssert(self.interactor, @"Interactor is nil");

    RAC(self, interactor.outputModel.text) = [self.nameTextField rac_textSignal];
}

@end
