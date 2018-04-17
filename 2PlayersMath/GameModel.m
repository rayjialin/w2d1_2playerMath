//
//  GameModel.m
//  2PlayersMath
//
//  Created by ruijia lin on 4/16/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _player = [Player new];
        _inputAnswer = [NSString new];
        Player *player1 = [Player new];
        Player *player2 = [Player new];
        player1.playerName = @"Player1";
        player2.playerName = @"Player2";
        _playerArray = [NSMutableArray arrayWithArray:@[player1,player2]];
        _playerIndex = 0;
        [self generateAnswer];
    }
    return self;
}

-(void)generateAnswer{
    NSArray *operatorArray = @[@"+",@"-",@"*",@"/"];
    
    self.leftNumber = arc4random_uniform(20)+1;
    self.rightNumber = arc4random_uniform(20)+1;
    self.mathOperator = [operatorArray objectAtIndex:arc4random_uniform([operatorArray count])];

    if ([_mathOperator isEqualToString:@"+"]){
        self.correctAnswer = self.leftNumber + self.rightNumber;
    }else if ([self.mathOperator isEqualToString:@"-"]){
        self.correctAnswer = self.leftNumber - self.rightNumber;
    }else if ([_mathOperator isEqualToString:@"*"]){
        self.correctAnswer = self.leftNumber * self.rightNumber;
    }else if ([_mathOperator isEqualToString:@"/"]){
        self.correctAnswer = self.leftNumber / self.rightNumber;
    }
}

-(BOOL)evaluateAnswer{
    
    Player *player = [self.playerArray objectAtIndex:self.playerIndex];
    
    if (self.correctAnswer == [self.inputAnswer integerValue]){
        player.playerScore += 1;
        [self.playerArray setObject:player atIndexedSubscript:self.playerIndex];
        return YES;
    }
    
    player.playerLife -= 1;
    if (player.playerLife <= 0){
        [self.playerArray setObject:player atIndexedSubscript:self.playerIndex];
    }
    
    [self.playerArray setObject:player atIndexedSubscript:self.playerIndex];
    return NO;

}

-(void)inputAnswer:(NSInteger)inputNumber {
    self.inputAnswer = [self.inputAnswer stringByAppendingFormat:@"%li",inputNumber];
}

-(void)nextPlayer{
    // iterate to next player index
    self.playerIndex++;
    if (self.playerIndex >= self.playerArray.count){
        self.playerIndex = 0;
    }
}
@end
