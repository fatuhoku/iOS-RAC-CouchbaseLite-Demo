//
//  MESTextLabelViewController.m
//  Vanguard
//
//  Created by Hok Shun Poon on 19/12/2014.
//  Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESTextLabelViewController.h"

@interface MESTextLabelViewController ()
@property(nonatomic, strong) NSString *textToDisplay;

@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@end

@implementation MESTextLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSAssert(self.textToDisplay, @"Things");

    self.textLabel.text = self.textToDisplay;
}

@end
