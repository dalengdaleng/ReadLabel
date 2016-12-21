//
//  ReaderLabel.m
//  ReaderLabelTest
//
//  Created by Netease on 15/9/22.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "ReaderLabel.h"
#import <CoreText/CoreText.h>

@interface ReaderLabel()
@property (nonatomic, retain)  NSMutableAttributedString *labelText;
@property (nonatomic,retain) UIFont *titleFont;
@property (nonatomic,retain) UIColor *labelBackGroundColor;
@property (nonatomic,retain) NSMutableParagraphStyle *paraGraphStyle;
@end

@implementation ReaderLabel

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {

    }
    return self;
}

- (id)init{
    self = [super init];
    if (self) {
        self.labelText = [[[NSMutableAttributedString alloc] init] autorelease];
    }
    return self;
}

- (void)awakeFromNib{
    self.labelText = [[[NSMutableAttributedString alloc] init] autorelease];
    
    self.titleFont =  self.font;
    [self setText:self.text];
}

//设置Label的内容
- (void)setText:(id)text{
    if ([text isKindOfClass:[NSString class]]) {
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text];
        [self.labelText setAttributedString:attributedText];
        [attributedText release];
    }
    else{
        [self.labelText setAttributedString:text];
    }
    if (self.paraGraphStyle!=nil) {
        [self.labelText addAttribute:NSParagraphStyleAttributeName value:self.paraGraphStyle range:NSMakeRange(0, self.labelText.length)];
    }
    if (self.titleFont!=nil) {
        [self.labelText addAttribute:NSFontAttributeName value:self.titleFont range:NSMakeRange(0, self.labelText.length)];
    }
    
    if (self.labelBackGroundColor!=nil) {
        [self.labelText addAttribute:NSBackgroundColorAttributeName value:self.labelBackGroundColor range:NSMakeRange(0, self.labelText.length)];
    }

    [self setAttributedText:self.labelText];
}

- (void)setParagraphStyle:(NSMutableParagraphStyle *)aStyle{
    self.paraGraphStyle = aStyle;
    [self.labelText addAttribute:NSParagraphStyleAttributeName value:aStyle range:NSMakeRange(0, self.labelText.length)];
      [self setAttributedText:self.labelText];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor{
    self.labelBackGroundColor = backgroundColor;
    [super setBackgroundColor:backgroundColor];
    if (!backgroundColor) {
        return;
    }
    [self.labelText addAttribute:NSBackgroundColorAttributeName value:backgroundColor range:NSMakeRange(0, self.labelText.length)];
    [self setAttributedText:self.labelText];
}


- (void)setLabelRangeBackgroundColor:(UIColor *)aColor Range:(NSRange )aRange{
    [self.labelText addAttribute:NSBackgroundColorAttributeName value:aColor range:aRange];
    [self setAttributedText:self.labelText];
}


- (void)setLabelTextColor:(UIColor *)aColor{
    [self.labelText addAttribute:NSForegroundColorAttributeName value:aColor range:NSMakeRange(0, self.labelText.length)];
     [self setAttributedText:self.labelText];
}

- (void)setLabelRangeTextColor:(UIColor *)aColor Range:(NSRange )aRange{
    [self.labelText addAttribute:NSForegroundColorAttributeName value:aColor range:aRange];
    [self setAttributedText:self.labelText];
}

- (void)setFont:(UIFont *)font{
    self.titleFont = font;
    [super setFont:font];
    [self setLabelFont:font];
}

- (void)setLabelFont:(UIFont *)font{
    [self.labelText addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.labelText.length)];//设置所有的字体
     [self setAttributedText:self.labelText];
}

- (void)setLabelRangeFont:(UIFont *)aFont Range:(NSRange)aRange{
    [self.labelText addAttribute:NSFontAttributeName value:aFont range:aRange];//设置所有的字体
    [self setAttributedText:self.labelText];
}

- (void)setUnderline:(NSUnderlineStyle)aUnderlineStyle  UnderlineColor:(UIColor *)aColor Range:(NSRange)aRange{
     [self.labelText addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:aUnderlineStyle] range:aRange];
    [self.labelText addAttribute:NSUnderlineColorAttributeName value:aColor range:aRange];
    
    [self setAttributedText:self.labelText];
}

- (CGFloat)labelHeightWithWidth:(CGFloat)aWidth MaxLines:(NSUInteger)aMaxLine{
      CGSize labelSize = self.labelText.size;
     CGRect frame = [self.labelText boundingRectWithSize:CGSizeMake(aWidth, MAXFLOAT) options: NSStringDrawingUsesFontLeading context:nil];
    
    NSUInteger num;
    if (frame.size.width == 0) {
        num = 0;
    }
    else{
        num = labelSize.width/frame.size.width;
        if (labelSize.width - num*frame.size.width > 0) {
            num +=1;
        }
    }

    
    NSUInteger realNum = 0;
    
    if (num>aMaxLine) {
        realNum = aMaxLine;
    }
    else{
        realNum = num;
    }
    CGFloat realHeight = frame.size.height*realNum;
    return realHeight;
}

- (void)dealloc{
    [_labelBackGroundColor release];
    [_titleFont release];
    [_paraGraphStyle release];
    [_labelText release];
    [super dealloc];
}

@end
