//
//  Dog.m
//  ZFTabbarViewController
//
//  Created by lisa on 2017/7/31.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import "Dog.h"

@implementation Dog

{
    NSString* toSetName;
    NSString* isName;
//    NSString* name;
    
//    NSString* _name;
    NSString* _isName;
}
// -(void)setName:(NSString*)name{
//     toSetName = name;
// }
//-(NSString*)getName{
//    return toSetName;
//}
+(BOOL)accessInstanceVariablesDirectly{
//    return NO;
    return YES;
}
-(id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"valueForUndefinedKey:  出现异常，该key不存在%@",key);
    return nil;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"setValue  forUndefinedKey:  出现异常，该key不存在%@",key);
}


@end
