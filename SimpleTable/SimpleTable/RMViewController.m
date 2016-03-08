//
//  RMViewController.m
//  SimpleTable
//
//  Created by Pupil on 11/21/14.
//  Copyright (c) 2014 MCCNH. All rights reserved.
//

#import "RMViewController.h"

@interface RMViewController ()
{
    NSArray *tableData;
    NSArray *tableImages;
    NSArray *tableCost;
    NSMutableArray *itemsPicked;
}
@end

@implementation RMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    tableImages = [NSArray arrayWithObjects:@"creme_brelee.jpg", @"Mushroom Risotto", @"breakfast2.jpg", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    tableCost = [NSArray arrayWithObjects:@4.99, @5.99, @7.99, @7.99, @8.99, @8.99, @3.99, @2.59, @4.99, @4.99, @5.99, @6.99, @1.99, @4.99, @8.99, @5.99, nil];
    itemsPicked = [[NSMutableArray alloc] initWithCapacity:3];
    [self initSelections];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    //cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];
    cell.imageView.image = [UIImage imageNamed:[tableImages objectAtIndex:indexPath.row]];    
    return cell;
}

-(IBAction)addClicked:(id)sender
{
    NSUInteger selectedRow = [menuTableView indexPathForSelectedRow].row;
    //    txtSelections.text = [NSString stringWithFormat:@"Selected item %u", selectedRow];
    [itemsPicked addObject:[NSNumber numberWithInteger:selectedRow]];
    [self updateCost];
    
}
-(IBAction)clearClicked:(id)sender
{
    [self initSelections];
}
-(void)initSelections
{
    [itemsPicked removeAllObjects];
    txtSelections.text = @"";
    lblTotalCost.text = @"";
}

-(void)updateCost
{
    NSString *currLabelText = [NSString stringWithString:txtSelections.text];
    NSNumber *itemNumber = (NSNumber *)[itemsPicked lastObject];
    //Get the index of the last item that was added
    NSUInteger index = [itemNumber unsignedIntValue];
    NSString *latestItem = (NSString *)[tableData objectAtIndex:index];
    NSNumber *costOfItem = (NSNumber *)[tableCost objectAtIndex:index];
    double cost = [costOfItem doubleValue];
    currLabelText = [NSString stringWithFormat:@"%@%@ = $%0.2f\n",currLabelText, latestItem, cost];
    txtSelections.text = currLabelText;
    
    double totalCost = 0.0;
    //Now calculate the total cost of the items
    for (int i=0; i < itemsPicked.count; i++)
    {
        itemNumber = (NSNumber *)itemsPicked[i];
        index = [itemNumber unsignedIntValue];
        costOfItem = (NSNumber *)tableCost[index];
        cost = [costOfItem doubleValue];
        totalCost += cost;
    }
    lblTotalCost.text = [NSString stringWithFormat:@"Total is $%0.2f", totalCost];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
