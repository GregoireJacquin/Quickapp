#import <Foundation/Foundation.h>
#import "Student.h"
int main (int argc, const char * argv[])
{
    @autoreleasepool {        
        Student *student = [[Student alloc] init];
        student.name = @"Bob";
        
        NSLog(@"Student %@",student);
        
        [student release];
    }
    return 0;
}

