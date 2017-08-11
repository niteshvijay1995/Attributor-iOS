//
//  TextStatsViewController.m
//  Attributor
//
//  Created by nitesh.vi on 11/08/17.
//  Copyright © 2017 nitesh.vi. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedLabel;

@end

@implementation TextStatsViewController

-(void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if(self.view.window) [self updateUI];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(NSAttributedString *)characterWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    
    int index=0;
    while(index < [self.textToAnalyze length])
    {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value)
        {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = (int)range.location + (int)range.length;
        }else {
            index++;
        }
        
    }
    return characters;
}

-(void)updateUI{
    self.colorfulLabel.text = [NSString stringWithFormat:@"%lu colorful characters", (unsigned long)[[self characterWithAttribute:NSForegroundColorAttributeName ]length]];
    self.outlinedLabel.text = [NSString stringWithFormat:@"%lu outlined characters", (unsigned long)[[self characterWithAttribute:NSStrokeWidthAttributeName ]length]];
}

@end
