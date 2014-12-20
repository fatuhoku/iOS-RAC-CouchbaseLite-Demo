//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESAssembly.h"
#import "MESTextLabelViewController.h"


@implementation MESAssembly

- (CustomViewController *)customViewController {
    return [TyphoonDefinition withClass:[MESTextLabelViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(textToDisplay) with:@"Yay Typhoon!"];
                          }];
}

@end