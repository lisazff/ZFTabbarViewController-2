//
//  TwoTimesArray.h
//  ZFTabbarViewController
//
//  Created by lisa on 2017/7/31.
//  Copyright © 2017年 lisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoTimesArray : NSObject

-(void)incrementCount; //增加数量
-(NSUInteger)countOfNumbers; // 如果上面的getter没有找到   KVC则会查找countOf<Key>,objectIn<Key>AtIndex,<Key>AtIndex格式的方法
-(id)objectInNumbersAtIndex:(NSUInteger)index;  //在 某位子的 对象

@end
