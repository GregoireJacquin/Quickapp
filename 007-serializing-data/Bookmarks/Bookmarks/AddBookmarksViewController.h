//
//  AddBookmarksViewController.h
//  Bookmarks
//
//  Created by Grégoire Jacquin on 21/01/13.
//  Copyright (c) 2013 Gr√©goire Jacquin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddBookmarksViewController;

@protocol AddBookmarksDelegate <NSObject>

- (void) AddBookmarksDelegateDidCancel:(AddBookmarksViewController *)controller;
- (void) AddBookmarksDelegate:(AddBookmarksViewController *)controller didSaveBookmarksWithLabel:(NSString *)label url:(NSString *)url;
@end

@interface AddBookmarksViewController : UIViewController

@property (nonatomic, assign) id <AddBookmarksDelegate> delegate;
@property (retain, nonatomic) IBOutlet UITextField *label;
@property (retain, nonatomic) IBOutlet UITextField *url;

@end