//
//  Belt.m
//  game
//
//  Created by ANGELA ZHOU on 4/10/15.
//  Copyright (c) 2015 ANGELA ZHOU. All rights reserved.
//

#import "Belt.h"

@implementation Belt

- (id)init: (int) initSpeed{
    self = [super init];
    if (self)
    {
        self.direction = 1;
        self.speed = initSpeed;
        self.spawn_position  = 0;
    }
    return self;
}

@end
