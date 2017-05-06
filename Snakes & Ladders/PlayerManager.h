//
//  PlayerManager.h
//  Snakes & Ladders
//
//  Created by Marc Maguire on 2017-05-06.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerManager : NSObject

@property (nonatomic) BOOL gameOver;
@property (nonatomic) NSMutableArray <Player *> *players;
@property (nonatomic) NSInteger currentIndex;

- (void)createPlayers:(int)numberOfPlayers;
- (Player *)currentActivePlayer;

- (void)roll;
- (void)output;
- (void)gameStateChecker;
- (NSString *)score;

@end
