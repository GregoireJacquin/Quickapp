//
//  ViewController.m
//  Bookmarks
//
//  Created by Grégoire Jacquin on 21/01/13.
//  Copyright (c) 2013 Grégoire Jacquin. All rights reserved.
//

#import "ViewController.h"
#import "AddBookmarksViewController.h"
#import "BookmarksManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Bookmarks";
    
    id addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAdd:)] autorelease];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onAdd:(id)sender
{
    AddBookmarksViewController *addBookmarksController = [[AddBookmarksViewController alloc] init];
    addBookmarksController.delegate = self;
    [self.navigationController pushViewController:addBookmarksController animated:YES];
    [addBookmarksController release];
}
#pragma mark - AddBookmarksDelegate

- (void)AddBookmarksDelegateDidCancel:(AddBookmarksViewController *)controller
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)AddBookmarksDelegate:(AddBookmarksViewController *)controller didSaveBookmarksWithLabel:(NSString *)label url:(NSString *)url
{
    Bookmark *book = [[[Bookmark alloc] init] autorelease];
    book.label = label;
    book.url = url;
    
    [[BookmarksManager sharedManager] addBookmarks:book];
    [self.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BookmarksManager sharedManager] bookmarks] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    Bookmark *book = [[[BookmarksManager sharedManager] bookmarks] objectAtIndex:indexPath.row];
    cell.textLabel.text = book.label;
    cell.detailTextLabel.text = book.url;
    
    return cell;
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
