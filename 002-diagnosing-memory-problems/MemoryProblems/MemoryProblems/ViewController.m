//
//  ViewController.m
//  MemoryProblems
//
//  Created by Grégoire Jacquin on 07/01/13.
//  Copyright (c) 2013 Grégoire Jacquin. All rights reserved.
//

#import "ViewController.h"

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
- (IBAction)createTheDate:(id)sender {
    //Probleme de fuite memoire.
    [date release];
    NSLog(@"Create the date");
    date = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
}
- (IBAction)releaseTheDate:(id)sender {
    NSLog(@"Release the date");
    [date release];
    //Probleme de zombie
    date = nil;
}
- (IBAction)sendMessageTheDate:(id)sender {
    NSLocale *frLocal = [[NSLocale alloc] initWithLocaleIdentifier:@"fr-FR"];
    NSString *localizedDescritpion = [date descriptionWithLocale:frLocal];
    NSLog(@"The localized description is %@",localizedDescritpion);
    //Relaché l'objet frLocale sinon fuite de memoire
    [frLocal release];
}

@end
