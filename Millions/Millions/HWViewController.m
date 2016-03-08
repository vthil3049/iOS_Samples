//
//  HWViewController.m
//  Millions
//
//  Created by Pupil on 10/2/14.
//  Copyright (c) 2014 MCCNH. All rights reserved.
//

#import "HWViewController.h"

@interface HWViewController ()

@end

@implementation HWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickedCalculate:(id)sender
{
    
    if ((txtPrincipal.text.length) && (txtInterest.text.length) )
    {
        //Convert the text to numbers
        double principal = [txtPrincipal.text doubleValue];
        double interest = [txtInterest.text doubleValue];
        interest /= 100.0;  //convert to decimal format
        
        //if our principal is in a reasonable range and our rate is good
        if ((principal > 1000) && (principal < 1000000) && (interest > 0.001))
        {
            double balance = principal;
            int year = 0;
            while (balance < 1000000)
            {
                balance = balance + balance * interest;
                year++;
            }
            
            NSString *outputMsg = [NSString stringWithFormat:@"You'll be a millionaire in %d years", year];
            lblMessage.text = outputMsg;
        }
        else if (principal >= 10000000)
        {
            lblMessage.text = @"You're already a millionaire";
        }
        else if (principal <= 1000)
        {
            lblMessage.text = @"That principal is too low";
        }
        else
        {
            lblMessage.text = @"That interest rate is too low";
        }
    }
}
-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}
@end
