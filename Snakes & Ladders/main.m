//
//  main.m
//  Snakes & Ladders
//
//  Created by Marc Maguire on 2017-05-06.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        PlayerManager *playerManager = [[PlayerManager alloc]init];
        
        printf("Welcome to Snakes and Ladders!\n\nPlease enter a number between 1 and 4 to select the amount of players for your game:\n");
        while (true) {
            
            
            while ([playerManager.players count] == 0) {
            char inputChars[255];
            fgets(inputChars, 255, stdin);
            NSString *result = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
            NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
            NSString *parsedString = [result stringByTrimmingCharactersInSet:charSet];
            
            if (([parsedString intValue] > 0) && ([parsedString intValue] < 5)){
                    //good input, have playerManager create players
                [playerManager createPlayers:[parsedString intValue]];
                
            } else {
                NSLog(@"Invalid input. Please enter a number between 1 and 4 to continue.");
            }
            
            }
//            char inputChars[255];
//            printf("Type \"r\" to roll:");
//            fgets(inputChars, 255, stdin);
//            NSString *result = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
//            NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//            NSString *parsedString = [result stringByTrimmingCharactersInSet:charSet];
//            //NSInteger parsedStringIntValue = [parsedString intValue];
//            
//            if ([parsedString containsString:@"r"]) {
//                [readyPlayerOne roll];
//                
//            }
//            [readyPlayerOne gameStateChecker];
//            
//        }
//        
        }
    }
    
    return 0;
}
