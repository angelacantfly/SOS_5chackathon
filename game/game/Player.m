//
//  Player.m
//  game
//
//  Created by ANGELA ZHOU on 4/10/15.
//  Copyright (c) 2015 ANGELA ZHOU. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id)init: (BOOL)isTopPlayer : (int) playerType{
    self = [super init];
    if (self)
    {
        self.current_hp = 100;
        self.isTopPlayer = isTopPlayer;
        self.player_type = playerType;
        
    }
    return self;
}
-(Food*) grabFood
{
    return Nil;
}

-(void) turnBelt
{
    
}

-(BOOL) die
{
    if (self.current_hp < 0)
        return false;
    else
        return true;
}

@end
