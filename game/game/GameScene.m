//
//  GameScene.m
//  game
//
//  Created by ANGELA ZHOU on 4/10/15.
//  Copyright (c) 2015 ANGELA ZHOU. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
//    /* Setup your scene here */
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//    
//    myLabel.text = @"Hello, World!";
//    myLabel.fontSize = 65;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
    
    CGSize size = CGSizeMake(200, 200);
    SKSpriteNode *p1Feed = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:size];
//    SKSpriteNode *p1Feed = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    p1Feed.position = CGPointMake(self.size.width/7, self.size.height/5);
    

    SKSpriteNode *p1Swap = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    p1Swap.position = CGPointMake(self.size.width/7, (self.size.height*4)/5);
    
    
    SKSpriteNode *p2Feed = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    p2Feed.position = CGPointMake((self.size.width*6)/7, (self.size.height*4)/5);
    
    
    SKSpriteNode *p2Swap = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    p2Swap.position = CGPointMake((self.size.width*6)/7, self.size.height/5);

    
    [self addChild:p1Feed];
    [self addChild:p1Swap];
    [self addChild:p2Feed];
    [self addChild:p2Swap];
    
    [self displayBelt];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
    }
}

- (void) displayBelt{
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
