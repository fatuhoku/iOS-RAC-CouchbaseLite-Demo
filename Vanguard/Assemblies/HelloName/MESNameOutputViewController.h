//
//  MESNameOutputViewController.h
//  Vanguard
//
//  Created by Hok Shun Poon on 19/12/2014.
//  Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TyphoonAutoInjection.h"

@class MESRecipe;
@class MESHelloNamePresenter;

// Given a MESRecipe, shows it a slightly differently.
@interface MESNameOutputViewController : UIViewController
@property(nonatomic, strong) InjectedClass(MESHelloNamePresenter) presenter;
@end

