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

- (void)roll {
    
    NSInteger randomValue = arc4random_uniform(6)+1;
    NSLog(@"%@ rolled a %ld",self.name, (long)randomValue);
    NSString *valueString = [NSString stringWithFormat:@"%lu",self.currentSquare + randomValue];
    
        if ([[self.gameLogic valueForKey:valueString]integerValue]) {
            
            self.currentSquare = [[self.gameLogic valueForKey:valueString]integerValue];
            
            
            if ([[self.gameLogic valueForKey:valueString]intValue] > [valueString intValue]) {
                
                NSLog(@"%@",[NSString stringWithFormat:@"Bonus! You landed on a ladder!"]);
                //calculate value change here
                //use ending value of (dictionary - intValue of the key) - random value to get starting square
                NSInteger changeValue = ([self.gameLogic[valueString]intValue]-[valueString intValue]) - randomValue;
                NSLog(@"%@ jumped from square %ld to %ld",self.name,self.currentSquare-changeValue,(long)self.currentSquare);
                
            } else {
                
                NSLog(@"%@",[NSString stringWithFormat:@"Ahhh!!! SNAKEEE!!!!!"]);
                //calculate value change
                //dict key - value - roll
                NSInteger changeValue = ([valueString intValue]-[self.gameLogic[valueString]intValue])-randomValue;
                NSLog(@"%@ slid from square %ld to %ld",self.name,self.currentSquare-changeValue,(long)self.currentSquare);
                
            }
            
        }else {
            
            self.currentSquare += randomValue;
            [self output];
           
        }
    }


- (void)output {
    
    NSLog(@"%@ landed on square: %ld",self.name, (long)self.currentSquare);
}

- (void)gameStateChecker {
    
    if (self.currentSquare >= 100) {
//        NSLog(@"Congratulations! You win!");
        //disable loop
        self.gameOver = YES;
        
        
    }
}

@end
