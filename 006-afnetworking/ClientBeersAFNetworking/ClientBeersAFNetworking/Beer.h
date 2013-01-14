//
//  beer.h
//  ClientBeersAFNetworking
//
//  Created by Grégoire Jacquin on 14/01/13.
//  Copyright (c) 2013 Gr√©goire Jacquin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Beer : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *descriptionBeer;

- (id)initWithDictionnary:(NSDictionary *)dictionnary;
@end
