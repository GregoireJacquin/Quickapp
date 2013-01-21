//
//  Bookmarks.m
//  Bookmarks
//
//  Created by Grégoire Jacquin on 21/01/13.
//  Copyright (c) 2013 Gr√©goire Jacquin. All rights reserved.
//

#import "Bookmark.h"

@implementation Bookmark

@synthesize url = _url;
@synthesize label = _label;

//Decode les objets
- (id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        self.label = [aDecoder decodeObjectForKey:@"label"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
    }
    
    return self;
}
//Encode les objets 
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.label forKey:@"label"];
    [aCoder encodeObject:self.url forKey:@"url"];
}
- (void)dealloc
{
    [_url release];
    [_label release];
    [super dealloc];
}

@end
