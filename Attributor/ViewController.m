//
//  ViewController.m
//  Attributor
//
//  Created by nitesh.vi on 11/08/17.
//  Copyright © 2017 nitesh.vi. All rights reserved.
//

#import "ViewController.h"
#import "TextStatsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textViewBody;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"Show Statistics"]){
        if([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]){
            TextStatsViewController *tsvc = (TextStatsViewController *)segue.destinationViewController;
            tsvc.textToAnalyze = self.textViewBody.textStorage;
        }
    }
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString: self.outlineButton.currentTitle];
    [title setAttributes:@{NSStrokeWidthAttributeName : @3,
                           NSStrokeColorAttributeName : self.outlineButton.tintColor} range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

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
