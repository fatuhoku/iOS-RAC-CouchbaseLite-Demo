//
// Created by Hok Shun Poon on 09/01/15.
// Copyright (c) 2015 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCollectionViewCell.h"
#import "MESRecipeCollectionViewCellPresenter.h"


@implementation MESRecipeCollectionViewCell

- (void)awakeFromNib {
    RAC(self, textLabel.text) = RACObserve(self, viewModel.title);
}

@end