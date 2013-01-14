//
//  beer.m
//  ClientBeersAFNetworking
//
//  Created by Grégoire Jacquin on 14/01/13.
//  Copyright (c) 2013 Gr√©goire Jacquin. All rights reserved.
//

#import "Beer.h"

@implementation Beer

- (id)initWithDictionnary:(NSDictionary *)dictionnary
{
    self = [super init];
    if(self)
    {
        self.name = [dictionnary objectForKey:@"name"];
        self.descriptionBeer = [dictionnary objectForKey:@"description"];
    }
    return self;
}
-(void)dealloc
{
    [self.name release];
    [self.descriptionBeer release];
    [super dealloc];
}
@end
