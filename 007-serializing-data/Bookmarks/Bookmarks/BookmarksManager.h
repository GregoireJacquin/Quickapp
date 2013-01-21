//
//  BookmarksManager.h
//  Bookmarks
//
//  Created by Grégoire Jacquin on 21/01/13.
//  Copyright (c) 2013 Gr√©goire Jacquin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bookmark.h"

@interface BookmarksManager : NSObject {
    NSString *path;
    NSMutableArray *bookmarks;
}
+ (id) sharedManager;
- (NSArray *)bookmarks;
- (void)addBookmarks:(Bookmark *)bookmark;
@end
