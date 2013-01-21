//
//  AddBookmarksViewController.m
//  Bookmarks
//
//  Created by Grégoire Jacquin on 21/01/13.
//  Copyright (c) 2013 Gr√©goire Jacquin. All rights reserved.
//

#import "AddBookmarksViewController.h"

@interface AddBookmarksViewController ()

@end

@implementation AddBookmarksViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIBarButtonItem *)saveButton
{
    return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(onSave:)] autorelease];
}
- (UIBarButtonItem *)cancelButton
{
    return [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onCancel:)] autorelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"AddBookmars";
    self.navigationItem.rightBarButtonItem = [self saveButton];
    self.navigationItem.leftBarButtonItem = [self cancelButton];
    [self.label becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onCancel:(id)sender
{
    [self.delegate AddBookmarksDelegateDidCancel:self];
}
- (void) onSave:(id)sender
{
    NSString *label = self.label.text;
    NSString *url = self.url.text;
    if([label length] == 0 && [url length] == 0)
    {
        return;
    }
    [self.delegate AddBookmarksDelegate:self didSaveBookmarksWithLabel:label url:url];
}

- (void)dealloc {
    [_label release];
    [_url release];
    [super dealloc];
}
@end
