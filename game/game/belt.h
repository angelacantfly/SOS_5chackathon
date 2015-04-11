//
//  Belt.h
//  game
//
//  Created by ANGELA ZHOU on 4/10/15.
//  Copyright (c) 2015 ANGELA ZHOU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Food.h"
#import "Player.h"

@interface Belt : NSObject

@property NSMutableArray* food_list;
@property BOOL direction;
@property int speed;
@property int spawn_position;

-(void)populateFoodList;
-(void) move;
-(void) switch_direction;
-(void) addFood:(Food*) new_food;
-(Food*) removeFood: (Player*) player;

@end
