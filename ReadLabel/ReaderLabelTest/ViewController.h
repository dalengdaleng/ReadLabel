//
//  ViewController.h
//  ReaderLabelTest
//
//  Created by Netease on 15/9/22.
//  Copyright © 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReaderLabel.h"

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet ReaderLabel *readerLabel;
- (IBAction)btnSelect:(id)sender;

- (IBAction)btnSelect2:(id)sender;
- (IBAction)btnChangeColor:(id)sender;
- (IBAction)btnChangeFont:(id)sender;
- (IBAction)btnUnderLine:(id)sender;

- (IBAction)btnBackgroundColor:(id)sender;
- (IBAction)btnGetFrame:(id)sender;

@end

