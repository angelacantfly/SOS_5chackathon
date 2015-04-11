//
//  Food.m
//  game
//
//  Created by ANGELA ZHOU on 4/10/15.
//  Copyright (c) 2015 ANGELA ZHOU. All rights reserved.
//

#import "Food.h"

@implementation Food

- (id)init: (NSString*) foodName : (NSString*) imgUrl : (int) health{
    self = [super init];
    if (self)
    {
        self.name = foodName;
        self.image_url = imgUrl;
        self.hp =health;
    }
    return self;
}

@end
