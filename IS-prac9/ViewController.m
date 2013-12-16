//
//  ViewController.m
//  IS-prac9
//
//  Created by Chida Mitsuhiro on 13/12/14.
//  Copyright (c) 2013年 Chida Mitsuhiro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *kg;
@property (weak, nonatomic) IBOutlet UITextField *cm;
@property (weak, nonatomic) IBOutlet UILabel *bmi;
@property (weak, nonatomic) IBOutlet UIProgressView *prg;
@property (weak, nonatomic) IBOutlet UILabel *msg;

- (IBAction)bgTapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bgTapped:(id)sender
{
    [self.view endEditing:YES];
}

- (IBAction)calc:(UIButton *)sender
{
    [self.view endEditing:YES];

    float weight,height,bmi;
    weight = [_kg.text floatValue];
    height = [_cm.text floatValue] / 100;
    bmi = [self calcBMI:weight tall:height];

    _bmi.text = [NSString stringWithFormat:@"%.1f",bmi];
    _prg.progress = (bmi -15) / 30;
    
    if (bmi<=0) {
        _msg.text= @"体重と身長を入力してください";
        _bmi.textColor = [UIColor blackColor];
        _prg.progressTintColor = [UIColor blackColor];
    } else if (bmi<18.5) {
        _msg.text= @"低体重";
        _bmi.textColor = [UIColor blueColor];
        _prg.progressTintColor = [UIColor blueColor];
    } else if (bmi<25.0) {
        _msg.text= @"普通体重";
        _bmi.textColor = [UIColor greenColor];
        _prg.progressTintColor = [UIColor greenColor];
    } else if (bmi<30.0) {
        _msg.text= @"肥満（1度）";
        _bmi.textColor = [UIColor yellowColor];
        _prg.progressTintColor = [UIColor yellowColor];
    } else if (bmi<35.0) {
        _msg.text= @"肥満（2度）";
        _bmi.textColor = [UIColor orangeColor];
        _prg.progressTintColor = [UIColor orangeColor];
    } else if (bmi<40.0) {
        _msg.text= @"肥満（3度）";
        _bmi.textColor = [UIColor purpleColor];
        _prg.progressTintColor = [UIColor purpleColor];
    } else {
        _msg.text= @"肥満（4度）";
        _bmi.textColor = [UIColor redColor];
        _prg.progressTintColor = [UIColor redColor];
    }
}

- (float)calcBMI:(float)kg tall:(float)m
{
    if ((kg <= 0) || (m <=0)) return 0;
    return (kg / (m * m));
}

@end
