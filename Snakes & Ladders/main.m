//
//  main.m
//  Snakes & Ladders
//
//  Created by Marc Maguire on 2017-05-06.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 ules of the Game
Snakes and Ladders is a simple children’s dice game. The goal of the game is to reach the finish square (100) before anyone else.

If a player lands on the bottom of a ladder, they move to the top of the ladder. Bonus!

But, if a player lands on a snake’s head, the player moves back to the snake’s tail. Bummer!

Part 1 Learning Outcomes
Can use NSNumber to wrap integers for inclusion in an NSDictionary
Can compare NSNumber values
Can use an NSDictionary for modeling moving squares when landing on ladders or snakes
Can override the default initializer init
Part 1 Goals
To create a single player command line game called Snakes & Ladders that models the kid's game
The app will wait for the user to type roll (or r for short) and will roll a random dice value between 1 and 6
Once the user rolls the app will move the user to a new square
The user will jump forward or go back depending whether they land on a ladder or snake
The app will inform the user which square they have landed on and whether they hit a snake or ladder along the way
When the user passes square 100 the game is over. Rnd the game and congratulate them.
*/

#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Player *readyPlayerOne = [[Player alloc]init];
        
        
        while (!readyPlayerOne.gameOver) {
            
            char inputChars[255];
            printf("Type \"r\" to roll:");
            fgets(inputChars, 255, stdin);
            NSString *result = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
            NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
            NSString *parsedString = [result stringByTrimmingCharactersInSet:charSet];
            //NSInteger parsedStringIntValue = [parsedString intValue];
            
            if ([parsedString containsString:@"r"]) {
                [readyPlayerOne roll];
                
            }
            [readyPlayerOne gameStateChecker];
            
        }
        
        }
        
    return 0;
}
