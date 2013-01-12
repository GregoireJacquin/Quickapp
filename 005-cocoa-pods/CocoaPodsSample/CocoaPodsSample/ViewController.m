//
//  ViewController.m
//  CocoaPodsSample
//
//  Created by Grégoire Jacquin on 10/01/13.
//  Copyright (c) 2013 Grégoire Jacquin. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

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
- (IBAction)fetchGoogleTapped:(id)sender {
    [SVProgressHUD show];
    NSURL *url = [NSURL URLWithString:@"http://google.fr"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[[AFHTTPRequestOperation alloc] initWithRequest:request] autorelease];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [SVProgressHUD dismissWithSuccess:@"Done!" afterDelay:1.0f];
        self.textView.text = operation.responseString;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", operation.responseString);
        [SVProgressHUD dismissWithError:@"Error!" afterDelay:1.0f];
    }];
    [operation start];
}


- (void)dealloc {
    [_textView release];
    [super dealloc];
}
@end
