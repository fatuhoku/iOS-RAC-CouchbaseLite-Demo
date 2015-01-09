//
// Created by Hok Shun Poon on 22/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESRecipeCellViewModel.h"
#import "MESRecipeEntity.h"


@interface MESRecipeCellViewModel ()
@property(nonatomic, readwrite) NSString *title;
@end

@implementation MESRecipeCellViewModel

- (instancetype)initWithRecipe:(id <MESRecipeEntity>)recipe {
    self = [super init];
    if (self != nil) {
        self.title = recipe.title;
    }
    return self;    
}

@end