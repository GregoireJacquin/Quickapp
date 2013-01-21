//
//  ViewController.h
//  Bookmarks
//
//  Created by Grégoire Jacquin on 21/01/13.
//  Copyright (c) 2013 Grégoire Jacquin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddBookmarksViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AddBookmarksDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
