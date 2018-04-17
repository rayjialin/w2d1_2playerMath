//
//  ViewController.h
//  2PlayersMath
//
//  Created by ruijia lin on 4/16/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *player1Life;
@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Life;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;
@property (weak, nonatomic) IBOutlet UILabel *gameQuestion;
@property (weak, nonatomic) IBOutlet UILabel *output;


@end

