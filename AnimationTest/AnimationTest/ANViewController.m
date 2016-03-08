//
//  ANViewController.m
//  AnimationTest
//
//  Created by Pupil on 12/4/14.
//  Copyright (c) 2014 MCCNH. All rights reserved.
//

#import "ANViewController.h"

@interface ANViewController ()
{
    NSArray *imageNames;
    NSArray *animationImages;
}

@end

@implementation ANViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imageNames =  [NSArray arrayWithObjects: @"Mushroom Risotto", @"breakfast.jpg", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];

 animationImages = [NSArray arrayWithObjects:                    [UIImage imageNamed:@"mushroom_risotto.jpg"],
     [UIImage imageNamed:@"full_breakfast.jpg"],                                       [UIImage imageNamed:@"hamburger.jpg"],                    [UIImage imageNamed:@"ham_and_egg_sandwich.jpg"],                    [UIImage imageNamed:@"creme_brelee.jpg"],                    [UIImage imageNamed:@"white_chocolate_donut.jpg"],                    [UIImage imageNamed:@"startbucks_coffee.jpg"],                    [UIImage imageNamed:@"vegetable_curry.jpg"],                    [UIImage imageNamed:@"instant_noodle_with_egg.jpg"],                    [UIImage imageNamed:@"japanese_noodle_with_pork.jpg"],                    [UIImage imageNamed:@"green_tea.jpg"],
                    nil];
    imgTestView.animationImages = animationImages;
    imgTestView.animationDuration = (NSTimeInterval)11.0;
    imgTestView.animationRepeatCount = 1;
//    [UIView setAnimationDelay:1.0];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onStartClicked:(id)sender {
        [imgTestView startAnimating];
}

- (IBAction)onStopClicked:(id)sender {
        [imgTestView stopAnimating];
}
@end
