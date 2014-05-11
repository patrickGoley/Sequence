//
//  SQNThemeManager.m
//  Sequence
//
//  Created by Patrick Goley on 5/11/14.
//  Copyright (c) 2014 Patrick Goley. All rights reserved.
//

#import "SQNThemeManager.h"
#import "UIColor-Expanded.h"
#import "NSDictionary+SafeParsing.h"
#import "NSParagraphStyle+Additions.h"

@interface SQNThemeManager ()

@property (nonatomic, strong) NSDictionary *defaultTheme;

@end

@implementation SQNThemeManager

+ (instancetype)manager {
    
    static __strong id manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[self alloc] init];
    });
    
    return manager;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        [self defaultTheme];
        
        [self reloadAppearanceProxies];
    }
    
    return self;
}

- (NSDictionary *)defaultTheme {
    
    if (!_defaultTheme) {
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"default_theme" ofType:@"plist"];
        
        NSDictionary *defaultTheme = [NSDictionary dictionaryWithContentsOfFile:filePath];
        
        NSAssert(defaultTheme, @"Default theme plist not found");
        
        _defaultTheme = defaultTheme;
    }
    
    return _defaultTheme;
}

- (void)reloadAppearanceProxies {
    
    UIColor *color = [self colorForKey:tNavBarBackgroundColor];
    
    [[UINavigationBar appearance] setBarTintColor:color];
    
    color = [self colorForKey:tNavBarTintColor];
    
    [[UINavigationBar appearance] setTintColor:color];
}

#pragma mark - Theme Accessors
#pragma mark -

+ (NSDictionary *)textAttributesForKey:(NSString *)key {
    
    return [[self manager] textAttributesForKey:key];
}

+ (UIColor *)colorForKey:(NSString *)key {
    
    return [[self manager] colorForKey:key];
}

+ (CGFloat)floatForKey:(NSString *)key {
    
    return [[self manager] floatvalueForKey:key];
}



- (NSDictionary *)textAttributesForKey:(NSString *)key {
    
    id element = [self themeElementForKey:key];
    
    return [self textAttributesFromDictionary:element];
}

- (UIColor *)colorForKey:(NSString *)key {
    
    id element = [self themeElementForKey:key];
    
    return [self colorFromElement:element];
}

- (CGFloat)floatvalueForKey:(NSString *)key {
    
    id element = [self themeElementForKey:key];
    
    return [self floatFromElement:element];
}



- (id)themeElementForKey:(NSString *)key {
    
    id element = [self.defaultTheme valueForKeyPath:key];
    
    return element;
}

#pragma mark - Theme Parsing

#pragma mark - NSTextAttributes

- (NSDictionary *)textAttributesFromDictionary:(NSDictionary *)rawAttributes {
    
    if (![rawAttributes isKindOfClass:[NSDictionary class]]) {
        
        rawAttributes = @{}; //if we're not passed a dictionary, just make an empty one so the default values are used
    }
    
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    
    UIFont *font = [self fontWithDictionary:rawAttributes[@"Font"]];
    
    textAttributes[NSFontAttributeName] = font;
    
    UIColor *color = [self colorFromElement:rawAttributes[@"Color"]];
    
    textAttributes[NSForegroundColorAttributeName] = color;
    
    NSParagraphStyle *paragraphStyle = [self paragraphStyleWithDictionary:rawAttributes[@"ParagraphStyle"]];
    
    textAttributes[NSParagraphStyleAttributeName] = paragraphStyle;
    
    return [textAttributes copy];
}

- (NSParagraphStyle *)paragraphStyleWithDictionary:(NSDictionary *)styleDictionary {
    
    if (![styleDictionary isKindOfClass:[NSDictionary class]]) {
        
        return [NSMutableParagraphStyle styleWithAlignment:NSTextAlignmentLeft];
    }
    
    NSString *alignmentString = styleDictionary[@"Alignment"];
    
    NSTextAlignment alignment = [self textAlignmentFromString:alignmentString];
    
    CGFloat lineHeightMultiple = [self floatFromElement:styleDictionary[@"LineHeightMultiple"]];
    
    if (lineHeightMultiple == 0) {
        
        lineHeightMultiple = 1; //0 doesn't make any sense as a line height multiple, default to 1
    }
    
    NSParagraphStyle *style;
    
    if (!lineHeightMultiple) {
        
        style = [NSMutableParagraphStyle styleWithAlignment:alignment];
    } else {
        
        style = [NSMutableParagraphStyle styleWithAlignment:alignment lineHeightMultiple:lineHeightMultiple];
    }
    
    return style;
}

- (NSTextAlignment)textAlignmentFromString:(NSString *)alignmentString {
    
    if ([alignmentString isEqualToString:@"center"]) {
        
        return NSTextAlignmentCenter;
        
    } else if ([alignmentString isEqualToString:@"right"]) {
        
        return NSTextAlignmentRight;
    }
    
    return NSTextAlignmentLeft;
}

#pragma mark - UIColor

- (UIColor *)colorFromElement:(id)element {
    
    if ([element isKindOfClass:[NSString class]]) {
        
        return [self colorFromString:element];
        
    } else if ([element isKindOfClass:[NSDictionary class]]) {
        
        return [self colorFromDictionary:element];
    } else {
        
        return [UIColor blackColor];
    }
}

- (UIColor *)colorFromString:(NSString *)colorString {
    
    if ([colorString rangeOfString:@"png"].location != NSNotFound) {
        
        return [self colorWithPatternImageString:colorString];
    }
    
    if ([colorString isEqualToString:@"clear"]) {
        
        return [UIColor clearColor];
    }
    
    NSString *selectorString = [colorString stringByAppendingString:@"Color"];
    
    if ([self stringIsValidColorSelector:selectorString]) {
        
        return [self colorFromSelectorString:selectorString];
    }
    
    return [UIColor colorWithHexString:colorString];
}


- (UIColor *)colorFromDictionary:(NSDictionary *)colorDictionary {
    
    if ([colorDictionary objectForKey:@"Tall"] || [colorDictionary objectForKey:@"Short"]) {
        
        return [self colorWithPatternImageDictionary:colorDictionary];
        
    } else {
        
        return [self colorFromRGBADictionary:colorDictionary];
    }
}

#pragma mark UIColor From Selector String

- (BOOL)stringIsValidColorSelector:(NSString *)colorSelectorString {
    
    SEL colorSelector = NSSelectorFromString(colorSelectorString);
    
    return [UIColor respondsToSelector:colorSelector];
}

- (UIColor *)colorFromSelectorString:(NSString *)colorSelectorString {
    
    SEL colorSelector = NSSelectorFromString(colorSelectorString);
    
    if ([UIColor respondsToSelector:colorSelector]) {
        
        return (UIColor *)[UIColor performSelector:colorSelector];
        
    } else {
        
        return [UIColor blackColor];
    }
}

#pragma mark UIColor With Pattern Image

- (UIColor *)colorWithPatternImageString:(NSString *)imageString {
    
    UIImage *patternImage = [UIImage imageNamed:imageString];
    
    if (patternImage) {
        
        return [UIColor colorWithPatternImage:patternImage];
    } else {
        
        return [UIColor blackColor];
    }
}

- (UIColor *)colorWithPatternImageDictionary:(NSDictionary *)colorDictionary {
    
    NSString *imageName;
    
    if (IPHONE_5) {
        
        imageName = [colorDictionary safeStringForKey:@"Tall"];
        
    } else {
        
        imageName = [colorDictionary safeStringForKey:@"Short"];
    }
    
    return [self colorWithPatternImageString:imageName];
}

#pragma mark UIColor From RGBA

- (UIColor *)colorFromRGBADictionary:(NSDictionary *)colorDictionary {
    
    CGFloat red = [self floatFromElement:colorDictionary[@"r"]];
    
    CGFloat green = [self floatFromElement:colorDictionary[@"g"]];
    
    CGFloat blue = [self floatFromElement:colorDictionary[@"b"]];
    
    CGFloat alpha = [self floatFromElement:colorDictionary[@"a"]];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

#pragma mark - UIFont

- (UIFont *)fontWithDictionary:(NSDictionary *)fontDictionary {
    
    NSString *fontName = fontDictionary[@"FontName"];
    
    CGFloat pointSize = [self floatFromElement:fontDictionary[@"Size"]];
    
    if (pointSize == 0) {
        
        pointSize = 14; //0 point size doesn't make sense, just default to some common size
    }
    
    UIFont *font = [UIFont fontWithName:fontName size:pointSize];
    
    if (!font) {
        
        font = [UIFont systemFontOfSize:pointSize];
    }
    
    return font;
}

#pragma mark - CG Values

- (CGFloat)floatFromElement:(id)element {
    
    if ([element isKindOfClass:[NSNumber class]]) {
        
        NSNumber *number = (NSNumber *)element;
        
        return [number floatValue];
        
    } else {
        
        return 0.0f;
    }
}

- (CGPoint)pointFromElement:(id)element {
    
    if ([element isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary *pointDict = (NSDictionary *)element;
        
        CGFloat x = [self floatFromElement:pointDict[@"x"]];
        
        CGFloat y = [self floatFromElement:pointDict[@"y"]];
        
        return CGPointMake(x, y);
        
    } else {
        
        return CGPointZero;
    }
}



@end
