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

@property (nonatomic) SKSpriteNode *cakeSpriteP1;
@property (nonatomic) SKSpriteNode *p1HandButton;
@property (nonatomic) SKSpriteNode *p2HandButton;
//@property (nonatomic) SKSpriteNode *p1SwapButton;
//@property (nonatomic) SKSpriteNode *p2SwapButton;
//@property (nonatomic) SKSpriteNode *p1FeedButton;
//@property (nonatomic) SKSpriteNode *p2FeedButton;


@end

@implementation GameScene{
    Player *p1;
    Player *p2;
    Belt *belt;
    SKAction *p1Eat;
    SKAction *p2Eat;
    AVAudioPlayer *octoSlurp;
    AVAudioPlayer *roboCrunch;
//    SKSpriteNode *cakeSpriteP1;
    SKSpriteNode *cakeSpriteP2;
    SKAction *moveP1;
    SKAction *moveP2;
    
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        int INIT_BELT_SPEED = 1;
        int P1_POS = 4;
        int P2_POS = 14;
//        p1.player_type = 0;
//        p2.player_type = 0;
        
        p1 = [[Player alloc] init:false :0 :P1_POS];
        p2 = [[Player alloc] init:true :0 :P2_POS];
        belt =  [[Belt alloc]init:INIT_BELT_SPEED];
        moveP1 = [SKAction moveByX:0 y:-100 duration:0.5];
        moveP2 = [SKAction moveByX:0 y:+100 duration:0.5];
        SKSpriteNode *backG = [SKSpriteNode spriteNodeWithImageNamed:@"background 1.png"];
        backG.position = CGPointMake(self.size.width/2, self.size.height/2);
        
        [belt populateFoodList];
        [self addChild: backG];
        [self setUpSounds];
//      [self displayHand];
    }
    return self;
}


-(void)didMoveToView:(SKView *)view {
    
//    CGSize size = CGSizeMake(200, 200);
    SKSpriteNode *p1Feed = [SKSpriteNode spriteNodeWithImageNamed:@"eat button.png"];
//    SKSpriteNode *p1Feed = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    p1Feed.name = @"p1Feed";
    
    p1Feed.position = CGPointMake(100, 100);
    

    SKSpriteNode *p1Swap = [SKSpriteNode spriteNodeWithImageNamed:@"swap 2 blue.png"];
    p1Swap.name = @"p1Swap";
    
    p1Swap.position = CGPointMake(100, self.size.height - 100);
    
    
    SKSpriteNode *p2Feed = [SKSpriteNode spriteNodeWithImageNamed:@"eat button 2.png"];
    p2Feed.name = @"p2Feed";
    
    p2Feed.position = CGPointMake(self.size.width - 100, self.size.height - 100);
    
    
    SKSpriteNode *p2Swap = [SKSpriteNode spriteNodeWithImageNamed:@"swap button.png"];
    p2Swap.name = @"p2Swap";
    
    p2Swap.position = CGPointMake(self.size.width - 100, 100);
    
    [self addChild:p1Feed];
    [self addChild:p1Swap];
    [self addChild:p2Feed];
    [self addChild:p2Swap];
    [self displayHand];
    [self displayBelt];
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    /* Called when a touch begins */
//    
//    for (UITouch *touch in touches) {
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
//    }
//}

- (void) displayHand{
    CGPoint p1hand = CGPointMake(100, self.size.height/2.0 );
//    self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"human open.png"];
    
    CGPoint p2hand = CGPointMake(self.size.width - 100, self.size.height/2.0);
  
//    SKSpriteNode *p2_hand_display = [SKSpriteNode spriteNodeWithImageNamed:@"human open2.png"];
    
    if(p1.player_type == 0){
        self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"human open.png"];
    }
    
    if(p2.player_type == 0){
        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"human open2.png"];
    }
    
    if(p1.player_type == 1){
        self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"robot open2.png"];
    }
    
    if(p2.player_type == 1){
        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"robot open.png"];
    }
    
    if(p1.player_type == 2){
        self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"tentacle open.png"];

    }
    
    if(p2.player_type == 2){
        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"tentacle open2.png"];
    }
    
    if(p1.player_type == 3){
        self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"human closed2.png"];
    }
    
    if(p2.player_type == 3){
        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"human closed.png"];
    }
    
    if(p1.player_type == 4){
        self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"robot closed2.png"];
    }

    if(p2.player_type == 4){
        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"robot closed.png"];
    }
    
    if(p1.player_type == 5){
        self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"tentacle closed2.png"];
    }
    
    if(p2.player_type == 5){
        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"tentacle closed.png"];
    }
    
    
    self.p1HandButton.name = @"p1hand";
    self.p1HandButton.position = p1hand;
    self.p2HandButton.name = @"p2hand";
    self.p2HandButton.position = p2hand;
    [self addChild:self.p1HandButton];
    [self addChild:self.p2HandButton];
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
    
//    [self displayCakeP1:p1left.x :p1left.y:cakeSpriteP1];
    
    self.cakeSpriteP1 = [SKSpriteNode spriteNodeWithImageNamed:@"cake.png"];
    self.cakeSpriteP1.position = CGPointMake(p1left.x , p1left.y);
    self.cakeSpriteP1.name = @"CAKE1";
    [self addChild:self.cakeSpriteP1];
    
    
    cakeSpriteP2 = [SKSpriteNode spriteNodeWithImageNamed:@"cake.png"];
    cakeSpriteP2.position = CGPointMake(p2left.x, p2left.y);
    [self addChild:cakeSpriteP2];

}
-(void)displayCakeP1:(CGFloat)xpos: (CGFloat)ypos:(SKSpriteNode*)sprite{
    sprite = [SKSpriteNode spriteNodeWithImageNamed:@"cake.png"];
    sprite.position = CGPointMake(xpos, ypos);
    [self addChild:sprite];
}

- (void)displayFood:(BOOL)isTopPlayer:(int) position{
    if (isTopPlayer) {
        Food* currentFood = belt.food_list[position];
        SKSpriteNode *foodSprite = [SKSpriteNode spriteNodeWithImageNamed:currentFood.image_url];
    }
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
    if (self.lastSpawnTimeInterval > 0.5) {
        self.lastSpawnTimeInterval = 0;
        // Belt move;
        [belt move];
        
//        [cakeSpriteP1 runAction:moveP1];
        if (self.cakeSpriteP1.position.y <0) {
            self.cakeSpriteP1.position= CGPointMake(self.cakeSpriteP1.position.x, self.size.height) ;
        }
        [cakeSpriteP2 runAction:moveP2];
        if (cakeSpriteP2.position.y >self.size.height) {
            cakeSpriteP2.position = CGPointMake(cakeSpriteP2.position.x, 0);
        }
//        NSLog(@" pos %d", belt.spawn_position);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    [self selectNodeForTouch:touchLocation];
}

- (void)selectNodeForTouch:(CGPoint)touchLocation
{
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
    
    if([[touchedNode name] isEqualToString: @"p1hand"]) {
        [self.p1HandButton runAction:[SKAction removeFromParent]];
        [self.p2HandButton runAction:[SKAction removeFromParent]];
        p1.player_type += 1;
        if (p1.player_type >2)
            p1.player_type = 0;
        [self displayHand];
        [octoSlurp play];
    }
    
    if([[touchedNode name] isEqualToString: @"p2hand"]) {
        [self.p1HandButton runAction:[SKAction removeFromParent]];
        [self.p2HandButton runAction:[SKAction removeFromParent]];
        p2.player_type += 1;
        if (p2.player_type >2)
            p2.player_type = 0;
        [self displayHand];
    }
    
    if([[touchedNode name] isEqualToString: @"p1Feed"]) {
        [self.p1HandButton runAction:[SKAction removeFromParent]];
        [self.p2HandButton runAction:[SKAction removeFromParent]];
        p1.player_type += 3;
        [self displayHand];
    }
    
    if([[touchedNode name] isEqualToString: @"p2Feed"]){
        [self.p1HandButton runAction:[SKAction removeFromParent]];
        [self.p2HandButton runAction:[SKAction removeFromParent]];
        p2.player_type += 3;
        [self displayHand];
    }
//    if([[touchedNode name] isEqualToString:self.cakeSpriteP1.name])
//    {
//        NSLog(@"caaaaaake");
//    }
    if([[touchedNode name] isEqualToString: @"p1Swap"] || [[touchedNode name] isEqualToString: @"p2Swap"]){
        [belt switch_direction];
        NSLog(@"%d", belt.direction);
    }
}

- (void) setUpSounds
{
    // Sound effects
    NSString *soundFilePath =
    [[NSBundle mainBundle] pathForResource: @"octoSlurp"
                                    ofType: @"mp3"];
    
    NSURL *slurpURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    octoSlurp    =
    [[AVAudioPlayer alloc] initWithContentsOfURL: slurpURL
                                           error: nil];

    
    [octoSlurp prepareToPlay];
    
}

@end
