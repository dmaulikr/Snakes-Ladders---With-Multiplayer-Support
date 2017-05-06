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

@end
