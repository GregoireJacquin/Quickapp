//
//  Bookmarks.h
//  Bookmarks
//
//  Created by Grégoire Jacquin on 21/01/13.
//  Copyright (c) 2013 Gr√©goire Jacquin. All rights reserved.
//

#import <Foundation/Foundation.h>


//NSCoding pour pouvoir serialiser Bookmarks
@interface Bookmark : NSObject <NSCoding>
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *label;
@end
