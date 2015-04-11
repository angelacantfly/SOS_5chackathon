//
//  GameScene.h
//  game
//

//  Copyright (c) 2015 ANGELA ZHOU. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GameScene : SKScene

@property (nonatomic, retain) AVAudioPlayer *player;

typedef enum {
    HUMAN = 0,
    ROBOT = 1,
    ALIEN = 2
} PLAYERTYPE;



@end
