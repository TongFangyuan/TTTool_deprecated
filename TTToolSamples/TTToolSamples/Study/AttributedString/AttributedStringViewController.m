//
//  AttributedStringViewController.m
//  TTToolSamples
//
//  Created by admin on 2018/7/23.
//  Copyright © 2018年 tongfy. All rights reserved.
//

#import "AttributedStringViewController.h"

@interface AttributedStringViewController ()

@property (weak, nonatomic) IBOutlet UITextField *VerticalGlyphFormTF;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation AttributedStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textChange:(NSNotification *)noti
{
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.label.text];
    NSMutableDictionary *attrsDict = [NSMutableDictionary dictionary];

    if (self.label.attributedText) {
        attributedText = self.label.attributedText.mutableCopy;
    }
    
    UITextField *textField = self.VerticalGlyphFormTF;
    if (textField == self.VerticalGlyphFormTF) {
        NSInteger value = [textField.text integerValue];
        [attrsDict setObject:@(value) forKey:NSVerticalGlyphFormAttributeName];
    }
    [attributedText addAttributes:attrsDict range:NSMakeRange(0, self.label.text.length)];
    
    
    self.label.attributedText = attributedText;
    [self.label sizeToFit];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
