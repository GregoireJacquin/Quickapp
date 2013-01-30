//
//  Student.m
//  SchoolApp
//
//  Created by Grégoire Jacquin on 02/01/13.
//  Copyright (c) 2013 NSScreencast. All rights reserved.
//

#import "Student.h"

@implementation Student
@synthesize name;

- (NSString *)description
{
    return self.name;
}
- (void)dealloc
{
    [name release];
    [super dealloc];
}
@end
