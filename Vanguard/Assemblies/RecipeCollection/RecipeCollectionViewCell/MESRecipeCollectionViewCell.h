//
// Created by Hok Shun Poon on 09/01/15.
// Copyright (c) 2015 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MESRecipeCollectionViewCellPresenter;


@interface MESRecipeCollectionViewCell : UITableViewCell
@property(nonatomic, strong) MESRecipeCollectionViewCellPresenter *viewModel;
@end