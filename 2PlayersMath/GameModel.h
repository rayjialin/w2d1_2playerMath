//
//  GameModel.h
//  2PlayersMath
//
//  Created by ruijia lin on 4/16/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject

@property NSInteger leftNumber;
@property NSInteger rightNumber;
@property NSInteger correctAnswer;
@property NSString *mathOperator;
@property NSInteger playerIndex;
@property Player *player;
@property NSMutableArray *playerArray;
@property NSString *inputAnswer;

-(void)generateAnswer;
-(BOOL)evaluateAnswer;
-(void)inputAnswer:(NSInteger)inputNumber;
-(void)nextPlayer;
@end
