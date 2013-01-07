//
//  ViewController.m
//  TableViewBasics
//
//  Created by Grégoire Jacquin on 07/01/13.
//  Copyright (c) 2013 Grégoire Jacquin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)loadBeers;
@end

@implementation ViewController

@synthesize tableView = _tableView;
@synthesize beers = _beers;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadBeers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_beers release];
    [_tableView release];
    [super dealloc];
}
#pragma mark - Personal methods
- (void)loadBeers
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"beers" ofType:@"plist"];
    self.beers = [NSArray arrayWithContentsOfFile:path];
    [self.tableView reloadData];
}
#pragma mark - Table View DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [self.beers count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell =  [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                reuseIdentifier:nil] autorelease];
        cell.textLabel.textColor = [[UIColor alloc] initWithRed:0.6f green:0.7f blue:0.8f alpha:1.0f];
    }
    
    NSDictionary *beer = [self.beers objectAtIndex:indexPath.row];
    
    UIImage *imageBeer = [UIImage imageNamed:[beer objectForKey:@"image"]];
    cell.textLabel.text = [beer objectForKey:@"name"];
    cell.detailTextLabel.text = [beer objectForKey:@"type"];
    cell.imageView.image = imageBeer;
    
    return cell; 
    
}

#pragma mark - Table View Delegate
@end
