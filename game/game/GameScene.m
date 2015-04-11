//
//  GameScene.m
//  game
//
//  Created by ANGELA ZHOU on 4/10/15.
//  Copyright (c) 2015 ANGELA ZHOU. All rights reserved.
//

#import "GameScene.h"
#import "Belt.h"
#import "Player.h"

@interface GameScene()

// Updates
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;

@end

@implementation GameScene{
    Player *p1;
    Player *p2;
    Belt *belt;
    SKAction *p1Eat;
    SKAction *p2Eat;
    
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        int INIT_BELT_SPEED = 1;
        int P1_POS = 5;
        int P2_POS = 15;
        
        p1 = [[Player alloc] init:false :HUMAN :P1_POS];
        p2 = [[Player alloc] init:true :HUMAN :P2_POS];
        belt =  [[Belt alloc]init:INIT_BELT_SPEED];
        
    }
    return self;
}


-(void)didMoveToView:(SKView *)view {
    
//    CGSize size = CGSizeMake(200, 200);
    SKSpriteNode *p1Feed = [SKSpriteNode spriteNodeWithImageNamed:@"eat button.png"];
//    SKSpriteNode *p1Feed = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    p1Feed.position = CGPointMake(100, 100);
    

    SKSpriteNode *p1Swap = [SKSpriteNode spriteNodeWithImageNamed:@"swap 2 blue.png"];
    
    p1Swap.position = CGPointMake(100, self.size.height - 100);
    
    
    SKSpriteNode *p2Feed = [SKSpriteNode spriteNodeWithImageNamed:@"eat button 2.png"];
    
    p2Feed.position = CGPointMake(self.size.width - 100, self.size.height - 100);
    
    
    SKSpriteNode *p2Swap = [SKSpriteNode spriteNodeWithImageNamed:@"swap button.png"];
    
    p2Swap.position = CGPointMake(self.size.width - 100, 100);

//    
    [self addChild:p1Feed];
    [self addChild:p1Swap];
    [self addChild:p2Feed];
    [self addChild:p2Swap];
    [self displayHand];
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
- (void) displayHand{
    CGPoint p1hand;
    CGPoint p2hand;
    
    p1hand = CGPointMake(100, self.size.height/2.0);
    p2hand = CGPointMake(self.size.width - 100, self.size.height/2.0);
    
    SKSpriteNode *p1_hand_display = [SKSpriteNode spriteNodeWithImageNamed:@"human open.png"];
    p1_hand_display.position = p1hand;
    
    SKSpriteNode *p2_hand_display = [SKSpriteNode spriteNodeWithImageNamed:@"human open2.png"];
    p2_hand_display.position = p2hand;
    
    [self addChild:p1_hand_display];
    [self addChild:p2_hand_display];
}

- (void) displayBelt{
    int belt_half = 50;
    CGSize belt_seg_size = CGSizeMake(100, 100);
    NSInteger sizeOfHand = 200;
    CGPoint p1left;
    CGPoint p1right;
    CGPoint p2right;
    CGPoint p2left;
    NSLog(@"width : %f", self.size.width);
    NSLog(@"height: %f", self.size.height);
    
    CGPoint p1_mid;
    CGPoint p2_mid;
    
    p1_mid = CGPointMake(sizeOfHand + belt_half, self.size.height/2.0);
    p2_mid = CGPointMake(self.size.width - sizeOfHand-belt_half, self.size.height/2.0);
    
    SKSpriteNode *p1mid = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:belt_seg_size];
    p1mid.position = p1_mid;
    SKSpriteNode *p2mid = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:belt_seg_size];
    p2mid.position = p2_mid;
    [self addChild:p1mid];
    [self addChild:p2mid];
    
    
    p1right = CGPointMake(p1_mid.x, p1_mid.y - 3 * 100 );
    p1left = CGPointMake(p1_mid.x, p1_mid.y + 3 * 100);
    p2right = CGPointMake(p2_mid.x,p2_mid.y - 3* 100 );
    p2left = CGPointMake(p2_mid.x, p2_mid.y + 3* 100 );
    
    SKSpriteNode *belt_seg1 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:belt_seg_size];
    belt_seg1.position = p1left;
    SKSpriteNode *belt_seg2 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:belt_seg_size];
    belt_seg2.position = p1right;
    SKSpriteNode *belt_seg3 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:belt_seg_size];
    belt_seg3.position = p2right;
    SKSpriteNode *belt_seg4 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:belt_seg_size];
    belt_seg4.position = p2left;
    [self addChild:belt_seg1];
    [self addChild:belt_seg2];
    [self addChild:belt_seg3];
    [self addChild:belt_seg4];
    

}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    // Handle time delta.
    // If we drop below 60fps, we still want everything to move the same distance.
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastSpawnTimeInterval += timeSinceLast;
    if (self.lastSpawnTimeInterval > 0.1) {
        self.lastSpawnTimeInterval = 0;
        // Belt move;
    }
}

@end
