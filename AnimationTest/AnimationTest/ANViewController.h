//
//  ANViewController.h
//  AnimationTest
//
//  Created by Pupil on 12/4/14.
//  Copyright (c) 2014 MCCNH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANViewController : UIViewController
{
    IBOutlet UIImageView *imgTestView;
}
- (IBAction)onStartClicked:(id)sender;
- (IBAction)onStopClicked:(id)sender;

@end
