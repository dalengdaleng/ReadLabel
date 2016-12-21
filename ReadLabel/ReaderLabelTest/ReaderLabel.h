//
//  ReaderLabel.h
//  ReaderLabelTest
//
//  Created by Netease on 15/9/22.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  
 */
@interface ReaderLabel : UILabel

/*!
 *  设置内容
 *
 *  @param text 设置的文本内容
 */
- (void)setText:(id)text;

/*!
 *  设置段落相关的属性
 *
 *  @param aStyle 段落的相关属性,应进行如下设置
 *  1、初始化一个NSMutableParagraphStyle；
 *  2、设置NSMutableParagraphStyle 的各个属性，其属性有
 *      1）lineSpacing：两行之间的行间距
 *      2）paragraphSpacing：段落之间的间距
 *      3）firstLineHeadIndent：首行缩进
 *      4）headIndent：头部缩进的距离
 *      5）tailIndent：尾部缩进的距离
 *      6）lineBreakMode：当内容显示不完时，省略号的位置
 *
 * 在设置的时候根据需要进行设置，然后通过调用此函数传递过来
 */
- (void)setParagraphStyle:(NSMutableParagraphStyle *)aStyle;

/*!
 *  设置背景颜色
 *
 *  @param backgroundColor 给定的背景颜色的值
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor;

/*!
 *  设置指定范围内的背景颜色
 *
 *  @param aColor 给定的颜色值
 *  @param aRange 给定的范围
 */
- (void)setLabelRangeBackgroundColor:(UIColor *)aColor Range:(NSRange )aRange;

/*!
 *  设置内容的字体颜色
 *
 *  @param aColor 设置的颜色值
 */
- (void)setLabelTextColor:(UIColor *)aColor;

/*!
 *  设置给定范围内字体的颜色
 *
 *  @param aColor 给定的颜色值
 *  @param aRange 给定的范围
 */
- (void)setLabelRangeTextColor:(UIColor *)aColor Range:(NSRange )aRange;

/*!
 *  设置全局的字体
 *
 *  @param font 给的字体
 */
- (void)setFont:(UIFont *)font;

/*!
 *  设置给定范围内的文本的字体
 *
 *  @param aFont  给定的字体
 *  @param aRange 给定的范围
 */
- (void)setLabelRangeFont:(UIFont *)aFont Range:(NSRange)aRange;

/*!
 *  为给定范围内的文本设置下划线
 *
 *  @param aUnderlineStyle 为下划线的样式，起样式包括：
 *      1）NSUnderlineStyleNone   不设置删除线
 *      2）NSUnderlineStyleSingle 设置下划线为细单实线
 *      3）NSUnderlineStyleThick  设置下划线为粗单实线
 *      4）NSUnderlineStyleDouble 设置下划线为细双实线
 *
 *  @param aColor 设置的下划线的颜色值
 *  @param aRange          设置下划线的范围
 */
- (void)setUnderline:(NSUnderlineStyle)aUnderlineStyle  UnderlineColor:(UIColor *)aColor Range:(NSRange)aRange;

/*!
 *  根据给定的宽度及最大想显示的行数，来返回相应的高度
 *
 *  @param aWidth   给的最大的宽度
 *  @param aMaxLine 给的最大的高度
 *
 *  @return 返回显示的高度
 */
- (CGFloat)labelHeightWithWidth:(CGFloat)aWidth MaxLines:(NSUInteger)aMaxLine;

@end
