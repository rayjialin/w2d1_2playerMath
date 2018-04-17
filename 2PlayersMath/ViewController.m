//
//  ViewController.m
//  2PlayersMath
//
//  Created by ruijia lin on 4/16/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property GameModel *gameModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gameModel = [GameModel new];
    
    [self updateInterface];
}


- (IBAction)evaluate:(UIButton *)sender {
    Player *player  = [self.gameModel.playerArray objectAtIndex:self.gameModel.playerIndex];
    
    // show correct/incorrect label
    BOOL output = [self.gameModel evaluateAnswer];
    if (output){
        self.output.alpha = 1;
        self.output.text = @"Boom!";
        self.output.textColor = [UIColor blackColor];
        self.output.backgroundColor = [UIColor greenColor];
        self.output.layer.cornerRadius = 16;
        self.output.clipsToBounds = YES;
        
        [UIView animateWithDuration:1 animations:^{
            self.output.alpha = 0;
        }];
        
    }else{
        self.output.alpha = 1;
        self.output.text = @"Bummer...";
        self.output.textColor = [UIColor blackColor];
        self.output.backgroundColor = [UIColor redColor];
        self.output.layer.cornerRadius = 16;
        self.output.clipsToBounds = YES;
        
        [UIView animateWithDuration:1 animations:^{
            self.output.alpha = 0;
        }];
    }
    
    // re-state game if one player dies
    if (player.playerLife <= 0){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Game Over!!!" message:@"Do you want to restart the game?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *yesButton = [UIAlertAction actionWithTitle:@"hell yeah!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.gameModel = [GameModel new];
            for (NSInteger idx = 0; idx < self.gameModel.playerArray.count; idx++){
                self.gameModel.playerIndex = idx;
                [self updateQuestion];
                [self updateInterface];
            }
//            self.gameModel.playerIndex = 1;
        }];
        
        [alert addAction:yesButton];
        UIAlertAction *noButton = [UIAlertAction actionWithTitle:@"nah..." style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:noButton];
        [self presentViewController:alert animated:true completion:nil];
        
    }
    
    [self updateQuestion];
    [self.gameModel nextPlayer];
    [self.gameModel generateAnswer];
    [self updateInterface];
}

- (IBAction)inputNumber:(UIButton *)sender {
    [self.gameModel inputAnswer:sender.tag];
}

-(void)updateInterface{
    Player *player  = [self.gameModel.playerArray objectAtIndex:self.gameModel.playerIndex];
    self.gameQuestion.text = [NSString stringWithFormat:@"%@: %li %@ %li", player.playerName, self.gameModel.leftNumber, self.gameModel.mathOperator, self.gameModel.rightNumber];
}

-(void)updateQuestion{
    Player *player  = [self.gameModel.playerArray objectAtIndex:self.gameModel.playerIndex];
    if (_gameModel.playerIndex == 0){
        self.player1Life.text = [NSString stringWithFormat:@"%@ Life: %li", player.playerName, player.playerLife];
        self.player1Score.text = [NSString stringWithFormat:@"%@ Score: %li", player.playerName, player.playerScore];
    }else{
        self.player2Life.text = [NSString stringWithFormat:@"%@ Life: %li", player.playerName, player.playerLife];
        self.player2Score.text = [NSString stringWithFormat:@"%@ Score: %li", player.playerName, player.playerScore];
    }
}
@end
