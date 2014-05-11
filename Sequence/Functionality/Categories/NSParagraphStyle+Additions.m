//
//  NSParagraphStyle+Additions.m
//  fa-coreproject-4.0
//
//  Created by Pat Goley on 11/12/13.
//  Copyright (c) 2013 Aloompa. All rights reserved.
//

#import "NSParagraphStyle+Additions.h"

@implementation NSParagraphStyle (Additions)

+ (NSMutableParagraphStyle *)styleWithAlignment:(NSTextAlignment)alignment {
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = alignment;
    
    return style;
}

+ (NSMutableParagraphStyle *)styleWithAlignment:(NSTextAlignment)alignment lineHeightMultiple:(CGFloat)lineHeightMultiple {
    
    NSMutableParagraphStyle *style = [self styleWithAlignment:alignment];
    style.lineHeightMultiple = lineHeightMultiple;
    
    return style;
}

@end
