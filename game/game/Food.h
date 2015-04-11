//
//  Food.h
//  game
//
//  Created by ANGELA ZHOU on 4/10/15.
//  Copyright (c) 2015 ANGELA ZHOU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property NSString *name;
@property NSString *image_url;
@property int hp;

- (id)init: (NSString*) foodName : (NSString*) imgUrl : (int) health;
@end
