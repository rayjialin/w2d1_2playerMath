//
//  Player.m
//  2PlayersMath
//
//  Created by ruijia lin on 4/16/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _playerLife = 3;
        _playerScore = 0;
        _playerAnswer = 0;
        _playerName = [NSString new];
    }
    return self;
}
@end
