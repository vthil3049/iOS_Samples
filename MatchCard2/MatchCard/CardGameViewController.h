//
//  CardGameViewController.h
//  MatchCard
//
//  Created by Pupil on 9/2/14.
//  Copyright (c) 2014 MCCNH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardGameViewController : UIViewController
{
    int yourScore;
    int phoneScore;
    
    IBOutlet UIButton *btn2;
    IBOutlet UILabel *lblYourScore;
    IBOutlet UILabel *lblPhoneScore;
    IBOutlet UILabel *lblExplanation;
    
}
- (IBAction)touchedCard:(UIButton *)sender;

- (IBAction)gameReset:(id)sender;

@end
