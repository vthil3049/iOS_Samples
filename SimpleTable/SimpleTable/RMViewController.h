//
//  RMViewController.h
//  SimpleTable
//
//  Created by Pupil on 11/21/14.
//  Copyright (c) 2014 MCCNH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UILabel *lblTotalCost;
    IBOutlet UITableView *menuTableView;
    IBOutlet UITextView *txtSelections;
}
-(IBAction)addClicked:(id)sender;
-(IBAction)clearClicked:(id)sender;
@end
