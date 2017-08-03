//
//  TwoTimesArray.m
//  ZFTabbarViewController
//
//  Created by lisa on 2017/7/31.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import "TwoTimesArray.h"

@interface TwoTimesArray ()

@property (nonatomic,readwrite,assign) NSUInteger count;
@property (nonatomic,copy) NSString* arrName;

@end
@implementation TwoTimesArray

-(void)incrementCount{ //自增函数 
    
    self.count ++;
}
-(NSUInteger)countOfNumbers{ // TwoTimesArra对象属性   是 numbers
    
    return self.count;
}
-(id)objectInNumbersAtIndex:(NSUInteger)index{     //当key使用numbers时，KVC会找到这两个方法。
    
    return @(index * 2);
}

-(NSUInteger)countOfNum{ // TwoTimesArra对象属性   是 numbers
    
    return self.count;
}


//-(NSInteger)getNum{                 //第一个,自己一个一个注释试
//    
//    return 10;
//}
-(NSInteger)num{                       //第二个
    
    return 11;
}
//-(NSInteger)isNum{                    //第三个
//    
//    return 12;
//}









@end
