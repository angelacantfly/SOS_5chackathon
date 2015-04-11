//
//  Player.h
//  game
//
//  Created by ANGELA ZHOU on 4/10/15.
//  Copyright (c) 2015 ANGELA ZHOU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Food.h"
@interface Player : NSObject

@property (nonatomic) bool isTopPlayer;
@property (nonatomic) int player_type;
@property (nonatomic) int current_hp;
@property (nonatomic) int position_on_belt;

@property bool can_grab;
@property bool can_turn;

-(Food*) grabFood;
-(void) turnBelt;
-(BOOL) die;
-(void) changeHp:(Food*) food;
@end
