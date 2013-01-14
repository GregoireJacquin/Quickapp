//
//  BeerApiClient.h
//  ClientBeersAFNetworking
//
//  Created by Grégoire Jacquin on 14/01/13.
//  Copyright (c) 2013 Gr√©goire Jacquin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface BeerApiClient : AFHTTPClient

+ (id)sharedInstance;
@end
