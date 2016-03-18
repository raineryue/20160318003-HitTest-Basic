//
//  RYWindow.m
//  20160318002-HitTest
//
//  Created by Rainer on 16/3/18.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYWindow.h"

@implementation RYWindow

/**
 *  Window的此方法是用来返回最合适的View处理事件
 *  调用时间：当事件传递给控件的时候就会掉用控件此方法来查找最时候处理的View
 *  方法作用：用来寻找处理事件的最合适的view
 *
 *  参数point：这个点是指当前触摸点，point这个点的坐标就是方法调用者
 */
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    // 这里掉用父类的方法来寻找最时候处理该事件的View
//    UIView *view = [super hitTest:point withEvent:event];
//    
//    NSLog(@"%@", view);
//    
//    // 这里的返回值可用来控制处理事件的控件（View），如果返回self的话就都由当前window来处理
//    return view;
//}
//
///**
// *  此方法用来判断当前触摸点是否在方法调用着（控件）上
// *  返回NO则不处理该事件
// */
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    return YES;
//}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s", __func__);
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
