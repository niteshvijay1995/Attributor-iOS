//
//  ViewController.m
//  Attributor
//
//  Created by nitesh.vi on 11/08/17.
//  Copyright © 2017 nitesh.vi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textViewBody;

@end

@implementation ViewController

- (IBAction)changeBackgroudColorOfSelectedTextTo:(UIButton *)sender {
    [self.textViewBody.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.textViewBody.selectedRange];
}
- (IBAction)outlineBodySelection:(UIButton *)sender {
    [self.textViewBody.textStorage addAttributes:@{ NSStrokeWidthAttributeName:@-3,
                                                    NSStrokeColorAttributeName:[UIColor blackColor]}
                                           range:self.textViewBody.selectedRange];
}

- (IBAction)unoutlineBodySelection:(id)sender {
    [self.textViewBody.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.textViewBody.selectedRange];
}

@end
