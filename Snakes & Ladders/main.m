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
        BOOL gameLoop = YES;
        
       
        while (gameLoop) {
            
        [playerManager.players removeAllObjects];
        playerManager.gameOver = NO;
        printf("Welcome to Snakes and Ladders!\n\nYou can enter 'quit' at anytime to exit the game. You can also enter 'restart' during a game if you would like to restart or change the amount of players.\n\nPlease enter a number between 1 and 4 to select the amount of players for your game:\n");
            while (!playerManager.gameOver) {
                
                BOOL immediateQuit = NO;
                while ([playerManager.players count] == 0) {
                
                    NSString *userRawInput = [InputHandler initiateUserInteraction];
                    NSString *userInput = [userRawInput lowercaseString];
                    
                    if (([userInput intValue] > 0) && ([userInput intValue] < 5)){
                            //good input, have playerManager create players
                        [playerManager createPlayers:[userInput intValue]];
                        NSLog(@"%lu players successfully created!\n",(unsigned long)[playerManager.players count]);
                    }else if ([userInput isEqualToString:@"quit"]) {
                        immediateQuit = YES;
                        break;
                    
                    }else {
                        NSLog(@"Invalid input. Please enter a number between 1 and 4 to continue.");
                    }
                
                }
                if (immediateQuit) {
                    gameLoop = NO;
                    break;
                }

                NSLog(@"It is %@'s turn! Please press 'r' to roll:", [playerManager currentActivePlayer].name);
                NSString *userRawInput = [InputHandler initiateUserInteraction];
                NSString *userInput = [userRawInput lowercaseString];
                
                    if ([userInput isEqualToString:@"r"]) {
                        
                        [playerManager roll];
                        NSLog(@"%@",[playerManager score]);
                        
                }   else if ([userInput isEqualToString:@"quit"]) {
                        NSLog(@"Would you like to quit, or restart the game?");
                        NSString *userRawInput = [InputHandler initiateUserInteraction];
                        NSString *userInput = [userRawInput lowercaseString];
                    
                        if ([userInput isEqualToString:@"quit"]) {
                            gameLoop = NO;
                            break;
                        } else if ([userInput isEqualToString:@"restart"]){
                            NSLog(@"Restarting!\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n");
                            break;
                        }
                }   else if ([userInput isEqualToString:@"restart"]) {
                        NSLog(@"Restarting!\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n");
                        break;
                }
 
                }
            

            
        }
      
                           
}
    return 0;
}
