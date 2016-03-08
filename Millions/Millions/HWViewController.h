//
//  HWViewController.h
//  Millions
//
//  Created by Pupil on 10/2/14.
//  Copyright (c) 2014 MCCNH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWViewController : UIViewController
{
    
    IBOutlet UITextField *txtPrincipal;
    IBOutlet UITextField *txtInterest;
    IBOutlet UILabel *lblMessage;
}
-(IBAction)clickedCalculate:(id)sender;
@end
