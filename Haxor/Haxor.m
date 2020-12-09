//
//  Haxor.m
//  Haxor
//
//  Created by Erhad Husovic on 12/9/20.
//

#import "Haxor.h"
#include <objc/runtime.h>

@implementation Haxor
+ (void)load{
    NSLog(@"ECHO Loading Dylib");
    
    Class thisClass = [self class];
    Class toReplaceClass = NSClassFromString(@"TestClass");
    
    SEL selReplace = @selector(replace);
    SEL selOriginal = @selector(whoami);
    
    Method replaceMethod = class_getInstanceMethod(thisClass, selReplace);
    Method originalMethod = class_getInstanceMethod(toReplaceClass, selOriginal);
    
    IMP impReplace = method_getImplementation(replaceMethod);
    
    method_setImplementation(originalMethod, impReplace);
}

- (void)replace{
    NSLog(@"ECHO I am from the dylib");
}
@end
