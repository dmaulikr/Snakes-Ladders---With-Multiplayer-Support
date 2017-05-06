//
//  Player.h
//  Snakes & Ladders
//
//  Created by Marc Maguire on 2017-05-06.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSInteger currentSquare;
@property (nonatomic) NSDictionary *gameLogic;
@property (nonatomic) BOOL gameOver;
@property (nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;
- (void)roll;
- (void)gameStateChecker;

@end
