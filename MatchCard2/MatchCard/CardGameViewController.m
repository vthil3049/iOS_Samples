//
//  CardGameViewController.m
//  MatchCard
//
//  Created by Pupil on 9/2/14.
//  Copyright (c) 2014 MCCNH. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@end


@implementation CardGameViewController
NSArray *validSuits, *validRanks;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    validSuits = @[@"♠",@"♣",@"♥",@"♦"];
    validRanks = @[@"A",@"2",@"3",@"4",@"5",@"6",@"7", @"8",@"9",@"10",@"J",@"Q",@"K"];
    
    NSLog(@"Displaying suits\n");
    for (int i=0; i < validSuits.count; i++)
    {
        NSLog(@"Suit at index %d is %@\n",i, validSuits[i]);
    }
    NSLog(@"Displaying ranks\n");
    
    for (int i=0; i < validRanks.count; i++)
    {
        NSLog(@"Rank at index %d is %@\n",i, validRanks[i]);
    }
    [self resetTheGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)resetTheGame
{
    yourScore = phoneScore = 0;
    lblExplanation.text = @"";
    [self updateScores];
}
-(void)updateScores
{
    NSString *scoreText = [NSString stringWithFormat:@"Your score is %d", yourScore];
    lblYourScore.text = scoreText;
    scoreText = [NSString stringWithFormat:@"Phone's score is %d", phoneScore];
    lblPhoneScore.text = scoreText;
    
}
- (IBAction)gameReset:(id)sender {
    [self resetTheGame];
}
- (IBAction)touchedCard:(UIButton *)sender {
    //UIButton *pButton = (UIButton *)sender;
    if ([sender.currentTitle length])
    {
        //When the card front is showing - flip it to show the back
        [sender setBackgroundImage:[UIImage imageNamed:@"CardBack.jpg"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:(UIControlStateNormal)];
        [btn2 setBackgroundImage:[UIImage imageNamed:@"CardBack.jpg"] forState:UIControlStateNormal];
        [btn2 setTitle:@"" forState:(UIControlStateNormal)];
        lblExplanation.text = @"";
        
    }
    else
    {
        //When the card back is showing - flip it to show the rank and suit
        [sender setBackgroundImage:[UIImage imageNamed:@"CardFront.jpg"] forState:UIControlStateNormal];
        int suit1 = arc4random_uniform(4);
        int rank1 = arc4random_uniform(13);
        NSString *cardTitle = [NSString stringWithFormat:@"%@%@", validRanks[rank1], validSuits[suit1]];
        [sender setTitle:cardTitle forState:(UIControlStateNormal)];
        
        [btn2 setBackgroundImage:[UIImage imageNamed:@"CardFront.jpg"] forState:UIControlStateNormal];
        int suit2 = arc4random_uniform(4);
        int rank2 = arc4random_uniform(13);
        cardTitle = [NSString stringWithFormat:@"%@%@", validRanks[rank2], validSuits[suit2]];
        [btn2 setTitle:cardTitle forState:(UIControlStateNormal)];
        
        NSString *explanationStr = @"";
        if (rank1 > rank2)
        {
            //you scored a point
            yourScore++;
            explanationStr = [NSString stringWithFormat:@"%@ > %@\nso you score a point", validRanks[rank1], validRanks[rank2]];
        }
        else if (rank1 == rank2)
        {
            explanationStr = [NSString stringWithFormat:@"%@ equals %@\nso you score 2 points", validRanks[rank1], validRanks[rank2]];
            yourScore += 2;
        }
        else
        {
            explanationStr = [NSString stringWithFormat:@"%@ < %@\nso phone scores a point", validRanks[rank1], validRanks[rank2]];
            phoneScore++;
        }
        lblExplanation.text = explanationStr;
        [self updateScores];
    }

}

@end
