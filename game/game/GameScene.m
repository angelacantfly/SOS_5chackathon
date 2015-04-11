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

@property (nonatomic) SKSpriteNode *p1HandButton;
@property (nonatomic) SKSpriteNode *p2HandButton;
//@property (nonatomic) SKSpriteNode *p1SwapButton;
//@property (nonatomic) SKSpriteNode *p2SwapButton;
//@property (nonatomic) SKSpriteNode *p1FeedButton;
//@property (nonatomic) SKSpriteNode *p2FeedButton;

@property NSInteger numberOfLoops;


@property (nonatomic) SKSpriteNode *p1swap;
@property (nonatomic) SKSpriteNode *p2swap;


@end

@implementation GameScene{
    Player *p1;
    Player *p2;
    Belt *belt;
    SKAction *p1Eat;
    SKAction *p2Eat;
    AVAudioPlayer *octoSlurp;
    AVAudioPlayer *roboCrunch;
    AVAudioPlayer *bgm;
    AVAudioPlayer *octoOw;
    AVAudioPlayer *roboOw;
    AVAudioPlayer *manYum;
    AVAudioPlayer *manOw;
    SKSpriteNode *cakeSpriteP1;
    SKSpriteNode *cakeSpriteP2;
    SKAction *moveP1;
    SKAction *moveP2;
    
    SKSpriteNode *jalSpritep1;
    SKSpriteNode *jalSpritep2;
    SKSpriteNode *bombSpritep1;
    SKSpriteNode *bombSpritep2;
    SKSpriteNode *chipSpritep1;
    SKSpriteNode *chipSpritep2;
    
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        int INIT_BELT_SPEED = 1;
        int P1_POS = 4;
        int P2_POS = 14;
        
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

    }
    return self;
}


-(void)didMoveToView:(SKView *)view {
    
//    CGSize size = CGSizeMake(200, 200);
    SKSpriteNode *p1Feed = [SKSpriteNode spriteNodeWithImageNamed:@"eat button.png"];
    p1Feed.name = @"p1Feed";
    
    p1Feed.position = CGPointMake(100, 100);
    

    self.p1swap = [SKSpriteNode spriteNodeWithImageNamed:@"swap 2 blue.png"];
    self.p1swap.name = @"p1Swap";
    
    self.p1swap.position = CGPointMake(100, self.size.height - 100);
    
    
    SKSpriteNode *p2Feed = [SKSpriteNode spriteNodeWithImageNamed:@"eat button 2.png"];
    p2Feed.name = @"p2Feed";
    
    p2Feed.position = CGPointMake(self.size.width - 100, self.size.height - 100);
    
    
    self.p2swap = [SKSpriteNode spriteNodeWithImageNamed:@"swap button.png"];
    self.p2swap.name = @"p2Swap";
    

    self.p2swap.position = CGPointMake(self.size.width - 100, 100);

    [self addChild:p1Feed];
    [self addChild:self.p1swap];
    [self addChild:p2Feed];
    [self addChild:self.p2swap];
    [self displayHand];
    [self displayBelt];
}


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

        self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"robot closed2.png"];
    }
    
    if(p2.player_type == 1){
        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"robot closed.png"];

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
    
    cakeSpriteP1 = [SKSpriteNode spriteNodeWithImageNamed:@"cake.png"];
    cakeSpriteP1.position = CGPointMake(p1left.x , p1left.y);
    cakeSpriteP1.name = @"CAKE1";
    [self addChild:cakeSpriteP1];
    jalSpritep1 = [SKSpriteNode spriteNodeWithImageNamed:@"jalapeno.png"];
    jalSpritep1.position = CGPointMake(p1left.x, p1left.y-100);
    jalSpritep1.name = @"JAL1";
    [self addChild:jalSpritep1];
    bombSpritep1 = [SKSpriteNode spriteNodeWithImageNamed:@"bomb.png"];
    bombSpritep1.position = CGPointMake(p1left.x, p1left.y - 3*100);
    bombSpritep1.name = @"BOMB1";
    [self addChild:bombSpritep1];
    chipSpritep1 = [SKSpriteNode spriteNodeWithImageNamed:@"chips.png"];
    chipSpritep1.position = CGPointMake(p1left.x, p1left.y - 6*100);
    chipSpritep1.name = @"CHIP1";
    [self addChild:chipSpritep1];
    
    cakeSpriteP2 = [SKSpriteNode spriteNodeWithImageNamed:@"cake.png"];
    cakeSpriteP2.position = CGPointMake(p2right.x, p2right.y);
    [self addChild:cakeSpriteP2];
    jalSpritep2 = [SKSpriteNode spriteNodeWithImageNamed:@"jalapeno.png"];
    jalSpritep2.position = CGPointMake(p2right.x, p2right.y+100);
    jalSpritep2.name = @"JAL2";
    [self addChild:jalSpritep2];
    bombSpritep2 = [SKSpriteNode spriteNodeWithImageNamed:@"bomb.png"];
    bombSpritep2.position = CGPointMake(p2right.x, p2right.y + 3*100);
    bombSpritep2.name = @"BOMB2";
    [self addChild:bombSpritep2];
    chipSpritep2 = [SKSpriteNode spriteNodeWithImageNamed:@"chips.png"];
    chipSpritep2.position = CGPointMake(p2right.x, p2right.y + 6*100);
    chipSpritep2.name = @"CHIP2";
    [self addChild:chipSpritep2];

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
        
        [self moveP1Sprite:cakeSpriteP1];
        [self moveP1Sprite:bombSpritep1];
        [self moveP1Sprite:jalSpritep1];
        [self moveP1Sprite:chipSpritep1];
        [self moveP2Sprite:cakeSpriteP2];
        [self moveP2Sprite:bombSpritep2];
        [self moveP2Sprite:jalSpritep2];
        [self moveP2Sprite:chipSpritep2];

    }
}

- (void) moveP1Sprite:(SKSpriteNode*) node{
    if (belt.direction) {
        [node runAction:moveP1];
    }
    else{
        [node runAction:moveP2];
    }
    
    if (node.position.y <0) {
        node.position= CGPointMake(node.position.x, self.size.height) ;
    }
    if (node.position.y >self.size.height) {
        node.position = CGPointMake(node.position.x, 0);
    }
}

- (void) moveP2Sprite:(SKSpriteNode*) node {
    if (belt.direction) {
        [node runAction:moveP2];
    }
    else{
        [node runAction:moveP1];
    }
    if (node.position.y >self.size.height) {
        node.position = CGPointMake(node.position.x, 0);
    }
    if (node.position.y <0) {
        node.position= CGPointMake(node.position.x, self.size.height) ;
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
        [self p1eat];
        [self displayHand];

    }
    
    if([[touchedNode name] isEqualToString: @"p2Feed"]){
        [self.p1HandButton runAction:[SKAction removeFromParent]];
        [self.p2HandButton runAction:[SKAction removeFromParent]];
        [self p2eat];
        [self displayHand];
    }

    if([[touchedNode name] isEqualToString: @"p1Swap"] || [[touchedNode name] isEqualToString: @"p2Swap"]){
        [belt switch_direction];
        NSLog(@"%d", belt.direction);

    }

}

- (void) p1eat{
    CGPoint p1hand = CGPointMake(150, self.size.height/2.0 );
    NSLog(@"p1eat %d", p1.player_type);
    if(p1.player_type == 0)
        self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"human closed2.png"];
    else if(p1.player_type == 1)
        self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"robot closed2.png"];
    else if(p1.player_type == 2)
        self.p1HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"tentacle closed2.png"];
    self.p1HandButton.position = p1hand;
    self.p1HandButton.name = @"p1Feed";
    SKAction *action = [SKAction sequence:@[[SKAction moveByX:-100 y:0 duration:0.5], [SKAction waitForDuration:0.5],[SKAction removeFromParent]]];
    [self addChild:self.p1HandButton];
    [self.p1HandButton runAction:action];

    
}
- (void) p2eat{
    CGPoint p2hand = CGPointMake(self.size.width - 100, self.size.height/2.0);
    NSLog(@"p2eat %d", p2.player_type);
    if(p2.player_type == 0){
        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"human closed.png"];
    }
    else if(p2.player_type == 1){
        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"robot closed.png"];
    }
    else if(p2.player_type == 2){
        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"tentacle closed.png"];
    }
    self.p2HandButton.position = p2hand;
    self.p2HandButton.name = @"p2Feed";
    SKAction *disappear = [SKAction sequence:@[[SKAction waitForDuration:0.4], [SKAction removeFromParent]]] ;
    SKAction *action = [SKAction sequence:@[[SKAction moveByX:100 y:0 duration:0.5], [SKAction waitForDuration:0.5],[SKAction removeFromParent]]];
    [cakeSpriteP1 runAction:disappear];
    [cakeSpriteP2 runAction:disappear];
    [self addChild:self.p2HandButton];
    [self.p2HandButton runAction:action];
//    
//    if(p2.player_type == 0){
//        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"human open.png"];
//    }
//    else if(p2.player_type == 1){
//        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"robot open.png"];
//    }
//    else if(p2.player_type == 2){
//        self.p2HandButton = [SKSpriteNode spriteNodeWithImageNamed:@"tentacle open.png"];
//    }
//    self.p2HandButton.position = p2hand;
//    self.p2HandButton.name = @"p2Feed";
//    [self addChild:self.p2HandButton];
    
    
}
- (void) setUpSounds
{
    // bgm
    
    NSString *bgmFilePath =
    [[NSBundle mainBundle] pathForResource: @"BGM"
                                    ofType: @"mp3"];
    
    NSURL *bgmURL = [[NSURL alloc] initFileURLWithPath: bgmFilePath];
    
    bgm    =
    [[AVAudioPlayer alloc] initWithContentsOfURL: bgmURL
                                           error: nil];
    
    

    [bgm play];
     bgm.numberOfLoops = -1;
    
    
    
    
    // octo
    NSString *slurpFilePath =
    [[NSBundle mainBundle] pathForResource: @"octoSlurp"
                                    ofType: @"mp3"];
    
    NSURL *slurpURL = [[NSURL alloc] initFileURLWithPath: slurpFilePath];
    
    octoSlurp    =
    [[AVAudioPlayer alloc] initWithContentsOfURL: slurpURL
                                           error: nil];

    
    [octoSlurp prepareToPlay];
    
    NSString *octoFilePath =
    [[NSBundle mainBundle] pathForResource: @"octoOw"
                                    ofType: @"mp3"];
    
    NSURL *octoURL = [[NSURL alloc] initFileURLWithPath: octoFilePath];
    
    octoOw    =
    [[AVAudioPlayer alloc] initWithContentsOfURL: octoURL
                                           error: nil];
    
    
    [octoOw prepareToPlay];
    
    // robo
    NSString *crunchFilePath =
    [[NSBundle mainBundle] pathForResource: @"roboCrunch"
                                    ofType: @"mp3"];
    
    NSURL *crunchURL = [[NSURL alloc] initFileURLWithPath: crunchFilePath];
    
    roboCrunch    =
    [[AVAudioPlayer alloc] initWithContentsOfURL: crunchURL
                                           error: nil];
    
    
    
    [roboCrunch prepareToPlay];
    
    NSString *roboFilePath =
    [[NSBundle mainBundle] pathForResource: @"roboOw"
                                    ofType: @"mp3"];
    
    NSURL *roboURL = [[NSURL alloc] initFileURLWithPath: roboFilePath];
    
    roboOw    =
    [[AVAudioPlayer alloc] initWithContentsOfURL: roboURL
                                           error: nil];
    
    
    
    [roboOw prepareToPlay];
    
    // hooman
    NSString *yumFilePath =
    [[NSBundle mainBundle] pathForResource: @"manYum"
                                    ofType: @"mp3"];
    
    NSURL *yumURL = [[NSURL alloc] initFileURLWithPath: yumFilePath];
    
    manYum    =
    [[AVAudioPlayer alloc] initWithContentsOfURL: yumURL
                                           error: nil];
    
    
    
    [manYum prepareToPlay];
    
    NSString *manFilePath =
    [[NSBundle mainBundle] pathForResource: @"manOw"
                                    ofType: @"mp3"];
    
    NSURL *manURL = [[NSURL alloc] initFileURLWithPath: manFilePath];
    
    manOw    =
    [[AVAudioPlayer alloc] initWithContentsOfURL: manURL
                                           error: nil];
    
    
    
    [manOw prepareToPlay];
    
}

@end
