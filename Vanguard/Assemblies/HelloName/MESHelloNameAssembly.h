//
// Created by Hok Shun Poon on 20/12/14.
// Copyright (c) 2014 Hok Shun Poon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon/Typhoon.h>

@class MESRecipe;

// This assembly creates a simple unit of value for the user:
//  - type name into the box
//  - when the user taps a button, transition is triggered
//  - The label says "Hello, [name]".
//
// Connect textField.signal to the
//  - Interaction (textField signal...?)
//  - Routing (the view controller needs to performSegue)
@interface MESHelloNameAssembly : TyphoonAssembly
@end