//
//  main.m
//  Snakes & Ladders
//
//  Created by Marc Maguire on 2017-05-06.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerManager.h"
#import "InputHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        PlayerManager *playerManager = [[PlayerManager alloc]init];
        
        
        printf("Welcome to Snakes and Ladders!\n\nPlease enter a number between 1 and 4 to select the amount of players for your game:\n");
        while (!playerManager.gameOver) {
            
            
            while ([playerManager.players count] == 0) {
            
                NSString *userInput = [InputHandler initiateUserInteraction];
                
                if (([userInput intValue] > 0) && ([userInput intValue] < 5)){
                        //good input, have playerManager create players
                    [playerManager createPlayers:[userInput intValue]];
                    
                } else {
                    NSLog(@"Invalid input. Please enter a number between 1 and 4 to continue.");
                }
            
            }
            
            NSLog(@"%lu players created!",(unsigned long)[playerManager.players count]);
            NSString *userInput = [InputHandler initiateUserInteraction];
  
            if ([parsedString containsString:@"r"]) {
//                [playerManager.activePlayer roll];
                
            }
//            [readyPlayerOne gameStateChecker];
            
        }
        
        }
    }
    
    return 0;
}
