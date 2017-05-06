//
//  Player.m
//  Snakes & Ladders
//
//  Created by Marc Maguire on 2017-05-06.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype)init {
    if (self = [super init]){
        
        _currentSquare = 0;
        _gameLogic = @{@"4" : @14,
                       @"9" : @31,
                       @"17" : @7,
                       @"20" : @38,
                       @"28" : @84,
                       @"40" : @59,
                       @"51" : @67,
                       @"63" : @81,
                       @"64" : @60,
                       @"89" : @26,
                       @"95" : @75,
                       @"99" : @78};
        _gameOver = NO;
        _name = @"Player 1";
    }
    
    return self;
}
- (instancetype)initWithName:(NSString *)name {
    
    if (self = [super init]){
        
        _currentSquare = 0;
        _gameLogic = @{@"4" : @14,
                       @"9" : @31,
                       @"17" : @7,
                       @"20" : @38,
                       @"28" : @84,
                       @"40" : @59,
                       @"51" : @67,
                       @"63" : @81,
                       @"64" : @60,
                       @"89" : @26,
                       @"95" : @75,
                       @"99" : @78};
        _gameOver = NO;
        _name = name;
    }
    
    return self;
    
}

-(void)roll {
    
    NSInteger randomValue = arc4random_uniform(6)+1;
    NSLog(@"You rolled a %ld",(long)randomValue);
    NSString *valueString = [NSString stringWithFormat:@"%lu",self.currentSquare + randomValue];
    
    if (self.currentSquare <= 99) {
        if ([[self.gameLogic valueForKey:valueString]integerValue]) {
            self.currentSquare = [[self.gameLogic valueForKey:valueString]integerValue];
            [self bonusTypeChecker:valueString];
            NSLog(@"Current square: %ld",(long)self.currentSquare);
        } else {
        
            self.currentSquare += randomValue;
            [self bonusTypeChecker:valueString];
            NSLog(@"Current square: %ld",(long)self.currentSquare);
        }
    }
    
    
}

- (void)bonusTypeChecker:(NSString *)stringValue {
    
    
    if ([self.gameLogic valueForKey:stringValue]) {
        
        if ([[self.gameLogic valueForKey:stringValue]intValue] > [stringValue intValue]) {
        
            NSLog(@"%@",[NSString stringWithFormat:@"Bonus! You landed on a ladder!"]);
        
        } else {
           
            NSLog(@"%@",[NSString stringWithFormat:@"Ahhh!!! SNAKEEE!!!!!"]);
        }
    }
    
    
}

- (void)gameStateChecker {
    
    if (self.currentSquare >= 100) {
        NSLog(@"Congratulations! You win!");
        //disable loop
        self.gameOver = YES;
        
        
    }
}

@end
