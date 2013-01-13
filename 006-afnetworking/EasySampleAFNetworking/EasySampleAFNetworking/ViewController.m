//
//  ViewController.m
//  EasySampleAFNetworking
//
//  Created by Grégoire Jacquin on 13/01/13.
//  Copyright (c) 2013 Grégoire Jacquin. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tableView = _tableView;
@synthesize result = _result;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://search.twitter.com/search.json?q=apple"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation;
    operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                success:^(NSURLRequest *req,NSHTTPURLResponse *response,id jsonObject){
                                                                    self.result = [jsonObject objectForKey:@"results"];
                                                                    NSLog(@"%@",self.result);
                                                                    [self.tableView reloadData];
                                                                }
                                                                failure:^(NSURLRequest *req,NSHTTPURLResponse *response,NSError *error,id jsonObject){
                                                                    NSLog(@"HTTP %d",response.statusCode);
                                                                    NSLog(@"Error %@",error);
                                                                }];
    [operation start];
    
    
	// Do any additional setup after loading the view, typically from a nib.
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
#pragma mark UITableViewDataSource - UItableViewDelegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.result count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
        cell.contentView.backgroundColor = self.tableView.backgroundColor;
        cell.textLabel.font = [UIFont boldSystemFontOfSize:14];
        cell.textLabel.textColor = [UIColor darkGrayColor];
    }
        
    
    NSDictionary *tweet = [self.result objectAtIndex:indexPath.row];
    cell.textLabel.text = [tweet objectForKey:@"from_user_name"];
    cell.detailTextLabel.text = [tweet objectForKey:@"text"];
    
    NSString *url = [tweet objectForKey:@"profile_image_url"];
    [cell.imageView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"avatar.jpg"]];
    
    return cell;
    
}
@end
