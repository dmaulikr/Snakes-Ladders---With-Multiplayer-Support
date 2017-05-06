//
//  PlayerManager.m
//  Snakes & Ladders
//
//  Created by Marc Maguire on 2017-05-06.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "PlayerManager.h"
#import "Player.h"

@implementation PlayerManager

-(instancetype)init {
    
    if (self = [super init]){
        
        _players =  [[NSMutableArray alloc]init];
        _currentIndex = 0;
        _gameOver = NO;
    }
    return self;
}

-(void)createPlayers:(int)numberOfPlayers{
    
    NSArray *numberArray = @[@"1",@"2",@"3",@"4"];
    NSString *player = @"Player ";
    
    for (int i=numberOfPlayers; i < 0; i--){
        
        NSString *playerName = [player stringByAppendingString:numberArray[numberOfPlayers-1]];
        Player *player = [[Player alloc]initWithName:playerName];
        [self.players addObject:player];
        
    }
}

- (Player *)currentActivePlayer {
    //when the index is 10, it should be the 2rd player.
    //super interesting way to check the active player while accounting for any amount of players (1,2,3 or 4) without using any logic statements.
    Player *currentActivePlayer = self.players[self.currentIndex%[self.players count]];
    //this is accessing the self.players array using [] notation. To compute the index of the current player we are doing currentIndex modulo count of players array
 
    return currentActivePlayer;
    
}

- (void)roll {
    
    [self.players[self.currentIndex] roll];
     self.currentIndex++;
}
- (void)output {
    
    [self.players[self.currentIndex] output];
    
}
- (void)gameStateChecker {
    
    [self.players[self.currentIndex] gameStateChecker];
    if (self.players[self.currentIndex].gameOver == YES){
        //end game
        self.gameOver = YES;
    }
    
}

@end
