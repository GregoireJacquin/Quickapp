//
//  ViewController.h
//  ClientBeersAFNetworking
//
//  Created by Grégoire Jacquin on 14/01/13.
//  Copyright (c) 2013 Grégoire Jacquin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSArray *result;

@end
