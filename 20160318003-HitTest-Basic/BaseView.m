//
//  BaseView.m
//  20160318001-TouchEvent
//
//  Created by Rainer on 16/3/18.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

/**
 *  触摸事件开始:这里来监听是谁处理事件
 *
 *  知识点总结：
 *
 *  事件传递顺序：UIApplication -> UIWindow(KeyWindow) -> 父视图 -> 当前视图
 *  如果当前视图或者父视图不处理则交由上层处理
 *  视图不能处理事件的三种情况：userInteractionEnabled = NO （不与用户交互）; hidden = YES（隐藏）; alpha = 0.00 ~ 0.01（透明度低于0.01）;
 *  UIImageView默认情况下是不与用户交互的，如果希望传递事件需要设置userInteractionEnabled = YES;UIImageView在使用可视化布局操作时不能添加子试图，需要代码添加
 *  如果父视图不能与用户交互则事件传递不到子视图，如果父视图被设置隐藏或者透明度低于0.01则会影响到子视图，子视图同样被隐藏
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", [self class]);
}

/**
 *  这里实现自定义hitTest方法揭秘系统底层实现
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 1.检测当前视图能否处理事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) return nil;
    
    // 2.检测当前触摸点是否在视图上
    if ([self pointInside:point withEvent:event] == NO) return nil;
    
    // 3.遍历子视图找到最合适处理事件的视图
    
    // 3.1.取得当前视图的子视图
    NSInteger subviewCount = self.subviews.count;
    
    // 3.2.遍历子视图
    for (NSInteger i = subviewCount - 1; i >= 0; i--) {
        // 3.2.1.取出当前i个视图
        UIView *childView = self.subviews[i];
        
        // 3.2.2.将父视图的点（point）转为子视图的点[注意：这里的方法要用convertPoint:toView:，而并非convertPoint:point fromView:]
        CGPoint childPoint = [self convertPoint:point toView:childView];
        
        // 3.2.3.递归找合适的视图
        UIView *fitView = [childView hitTest:childPoint withEvent:event];
        
        // 3.3.4.返回合适的视图
        if (fitView) return fitView;
    }
    
    // 4.如果没有就返回当前视图
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
