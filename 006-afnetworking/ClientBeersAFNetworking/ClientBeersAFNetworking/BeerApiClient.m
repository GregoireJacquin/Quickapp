//
//  BeerApiClient.m
//  ClientBeersAFNetworking
//
//  Created by Grégoire Jacquin on 14/01/13.
//  Copyright (c) 2013 Gr√©goire Jacquin. All rights reserved.
//

#import "BeerApiClient.h"
#import "AFNetworking.h"

#define BeersApiClientURLString @"http://localhost:3000"
#define BeersApiToken @"abcd1234"

@implementation BeerApiClient

+(id)sharedInstance
{
    static BeerApiClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        __sharedInstance = [[BeerApiClient alloc] initWithBaseURL:[NSURL URLWithString:BeersApiClientURLString]];
    });
    
    return __sharedInstance;
}

- (id) initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if(self)
    {
        [self setDefaultHeader:@"x-api-token" value:BeersApiToken];
        
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]]; 
    }
    return self;
}
@end
