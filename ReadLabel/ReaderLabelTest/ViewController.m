//
//  ViewController.m
//  ReaderLabelTest
//
//  Created by Netease on 15/9/22.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"1321313123211273127318273819273817381738713712837173812731837128371297319737131719371273187328193721731793\n"];
//    
//    //设置缩进、行距
//    
//    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//    style.headIndent = 30;//缩进
//    style.firstLineHeadIndent = 10;
//    [text addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
//    
//    NSMutableParagraphStyle *style1 = [[NSMutableParagraphStyle alloc] init];
//    style1.lineSpacing = 20;//行距
//    [text addAttribute:NSParagraphStyleAttributeName value:style1 range:NSMakeRange(0, text.length)];
//    
//     [text addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, text.length)];
//    [text addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 3)];
//
//    
//    
//    
//    [self.readerLabel setAttributedText:text];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_readerLabel release];
    [super dealloc];
}
- (IBAction)btnSelect:(id)sender {
    [self.readerLabel setText:@""];
}

- (IBAction)btnSelect2:(id)sender {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//     style.headIndent = 50;//缩进
    style.firstLineHeadIndent = 30;
//    style.lineSpacing = 20;
    style.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.readerLabel setParagraphStyle:style];
    [style release];

}

- (IBAction)btnChangeColor:(id)sender {

    [self.readerLabel setLabelTextColor:[UIColor redColor]];
    [self.readerLabel setLabelRangeTextColor:[UIColor greenColor] Range:NSMakeRange(0, 2)];
}

- (IBAction)btnChangeFont:(id)sender {
    UIFont *Font1 = [UIFont systemFontOfSize:20.0];
    UIFont *Font2 = [UIFont boldSystemFontOfSize:20.0];
    
    [self.readerLabel setFont:Font1];
    [self.readerLabel setLabelRangeFont:Font2 Range:NSMakeRange(0, 3)];
}

- (IBAction)btnUnderLine:(id)sender {
    [self.readerLabel setUnderline:NSUnderlineStyleSingle UnderlineColor:[UIColor blueColor] Range:NSMakeRange(0, 5)];
    
    [self.readerLabel setUnderline:NSUnderlineStyleThick UnderlineColor:[UIColor redColor] Range:NSMakeRange(3, 5)];
    
     [self.readerLabel setUnderline:NSUnderlineStyleDouble UnderlineColor:[UIColor redColor] Range:NSMakeRange(5, 5)];
}

- (IBAction)btnBackgroundColor:(id)sender {
    [self.readerLabel setBackgroundColor:[UIColor grayColor]];
    [self.readerLabel setLabelRangeBackgroundColor:[UIColor greenColor] Range:NSMakeRange(0, 10)];
    
    
}

- (IBAction)btnGetFrame:(id)sender {
    self.readerLabel.numberOfLines = 0;

    CGFloat height = [self.readerLabel labelHeightWithWidth:self.readerLabel.frame.size.width MaxLines:2];
    
    CGRect labelFrame = self.readerLabel.frame;
    labelFrame.size.height = height;
    [self.readerLabel setFrame:labelFrame];
}
@end
