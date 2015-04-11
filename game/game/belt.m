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
        self.food_list = [[NSMutableArray alloc] initWithCapacity:200];
        for (int i = 0; i < 200; i++) {
            [self.food_list addObject:@(i)];
        }
        
        self.direction = true;
        self.speed = initSpeed;
        self.spawn_position  = 0;
    }
    return self;
}

-(void) populateFoodList{
    for (int i = 0; i < 200; i++) {
        
    }
    
}
-(void) move{
    if (self.direction)
        self.spawn_position += self.speed;
    else
        self.spawn_position -= self.speed;
}

-(void) switch_direction{
    self.direction = !self.direction;
}

-(void) addFood:(Food*) new_food{
    [self.food_list insertObject:new_food atIndex:self.spawn_position];
}

-(Food*) removeFood: (Player*) player{
    Food* removedFood = self.food_list[player.position_on_belt];
    [self.food_list removeObject:removedFood];
    return removedFood;
}

@end
