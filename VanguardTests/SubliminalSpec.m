//
//  SubliminalSpec.m
//  Vanguard-iOS
//
//  Created by Hok Shun Poon on 19/12/2014.
//  Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#define EXP_SHORTHAND

#import <Expecta/Expecta.h>
#import <Specta/Specta.h>
#import <Subliminal/Subliminal.h>

SpecBegin(Subliminal)

describe(@"Subliminal-enabled application", ^{
    SLElement *submitButton = [SLElement elementWithAccessibilityLabel:@"Button"];

    [submitButton tap];

    // TODO Check whether the submit button indeed was clicked.
});

SpecEnd