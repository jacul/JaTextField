//
//  JaTextField.m
//  JaTextFieldDemo
//
//  Created by zxd on 15/1/29.
//  Copyright (c) 2015 Jacul. All rights reserved.
//

#import "JaTextField.h"

@interface JaTextField (){
    void(^action)(void);
}

@end

@implementation JaTextField

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self addTarget:self action:@selector(keyboardDidEnter:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return self;
}


-(void)keyboardDidEnter:(id)sender{
    if (action) {
        //A callback was setup, invoke it
        action();
        return;
    }
    
    //So find the next nearest text field
    UIView* superview = self.superview;
    
    //Checking rect is an area containing all views underneath the current view
    CGRect checkingrect = CGRectMake(0, self.frame.origin.y, superview.frame.size.width, superview.frame.size.height-self.frame.origin.y);
    
    UIView* nearestTextField = nil;
    
    for (UIView* subview in superview.subviews) {
        if (subview != self && [subview isKindOfClass:[JaTextField class]] && CGRectContainsPoint(checkingrect, subview.frame.origin)) {
            //Qualifying subview is an instance of JaTextField and within the rect
            if (nearestTextField == nil) {
                
                nearestTextField = subview;
            }else if(subview.frame.origin.x < nearestTextField.frame.origin.x){
                
                nearestTextField = subview;
            }else if(subview.frame.origin.y < nearestTextField.frame.origin.y){
                
                nearestTextField = subview;
            }
        }
    }
    
    if (nearestTextField!=nil) {
        [nearestTextField becomeFirstResponder];
    }
}

-(void)setBehaviorForReturnKey:(void (^)(void))actionOnReturn{
    action = actionOnReturn;
}
@end
