//
//  Player.m
//  game
//
//  Created by ANGELA ZHOU on 4/10/15.
//  Copyright (c) 2015 ANGELA ZHOU. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id)init: (BOOL)isTopPlayer : (int) playerChar: (int) beltPosition{
    self = [super init];
    if (self)
    {
        self.current_hp = 100;
        self.isTopPlayer = isTopPlayer;
        self.player_type = playerChar;
        self.position_on_belt = beltPosition;
        
    }
    return self;
}
-(Food*) grabFood
{
    // needs to send main a message
    // update belt using removeFood method
    Food* gotFood; // update this when calling removeFood
    if (gotFood) {
        [self changeHp:gotFood];
    }
    return Nil;
}

-(void) changeHp:(Food*) food
{
    self.current_hp += food.hp;
}

-(void) turnBelt
{
    // needs to send main a message
    // and main would call belt's switch_direction method;
}

-(BOOL) die
{
    if (self.current_hp < 0)
        return false;
    else
        return true;
}

@end
