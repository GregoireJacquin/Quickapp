//
//  ViewController.m
//  ClientBeersAFNetworking
//
//  Created by Grégoire Jacquin on 14/01/13.
//  Copyright (c) 2013 Grégoire Jacquin. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "BeerApiClient.h"
#import "Beer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithRed:0.96 green:0.95 blue:0.90 alpha:1.0];
	// Do any additional setup after loading the view, typically from a nib.
    [[BeerApiClient sharedInstance] getPath:@"beers.json" parameters:nil
                                    success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                        NSLog(@"%@",responseObject);
                                        NSMutableArray *results = [NSMutableArray array];
                                        for (id beerDictionnary in [responseObject objectForKey:@"beers"]) {
                                            Beer *beer = [[Beer alloc] initWithDictionnary:beerDictionnary];
                                            NSLog(@"%@",beer);
                                            [results addObject:beer];
                                            [beer release];
                                        }
                                        self.result = results;
                                        [self.tableView reloadData];
                                    }
                                    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                        NSLog(@"Error %@",error);
                                    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
#pragma mark UITableViewDataSource - UITableViewDelegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.result count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
        cell.contentView.backgroundColor = self.tableView.backgroundColor;
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.textLabel.textColor = [UIColor darkGrayColor];
    }
    Beer *beer = [self.result objectAtIndex:indexPath.row];
    cell.textLabel.text = beer.name;
    cell.detailTextLabel.text = beer.descriptionBeer;
    
    return cell;
}
@end
