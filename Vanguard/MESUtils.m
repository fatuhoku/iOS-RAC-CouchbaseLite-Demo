//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import "MESUtils.h"


@implementation MESUtils

+ (void)assertNoError:(NSError *)error {
    NSAssert(error == nil, ([@"There was a problem: %@", error localizedDescription]));
}

@end