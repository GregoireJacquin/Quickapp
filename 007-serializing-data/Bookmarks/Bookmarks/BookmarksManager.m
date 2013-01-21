//
//  BookmarksManager.m
//  Bookmarks
//
//  Created by Grégoire Jacquin on 21/01/13.
//  Copyright (c) 2013 Gr√©goire Jacquin. All rights reserved.
//

#import "BookmarksManager.h"

@implementation BookmarksManager
//creer
+ (id)sharedManager
{
    static BookmarksManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[BookmarksManager alloc] init];
    });
    
    return _instance;
}
- (id)init
{
    if(self = [super init])
    {
        NSString *documentPath = nil;
        NSArray *paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        documentPath = [paths objectAtIndex:0];
        path = [[documentPath stringByAppendingPathComponent:@"bookmarks.plist"] retain];
        NSLog(@"Saving path %@",path);
    }
    return self;
}
- (void)loadBookmarks
{
    bookmarks = [[NSKeyedUnarchiver unarchiveObjectWithFile:path] retain];
    if(!bookmarks)
    {
        bookmarks = [[NSMutableArray array] retain];
    }
}
- (NSArray *)bookmarks
{
    if(!bookmarks)
    {
        [self loadBookmarks];
    }
    return bookmarks;
}
- (void)addBookmarks:(Bookmark *)bookmark
{
    if (!bookmarks)
        [self loadBookmarks];
    [bookmarks addObject:bookmark];
    NSLog(@"Save bookmark %@",bookmark);
    [NSKeyedArchiver archiveRootObject:bookmarks toFile:path];
}
- (void)dealloc
{
    [path release];
    [bookmarks release];
    [super dealloc];
}
@end
