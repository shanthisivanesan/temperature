//
//  TemperatureVC.m
//  temperature
//
//  Created by user on 2/24/14.
//  Copyright (c) 2014 ShanthiSivanesan. All rights reserved.
//

#import "TemperatureVC.h"

@interface TemperatureVC ()

@property (strong, nonatomic) IBOutlet UITextField *fahrenheitTextField;

@property (strong, nonatomic) IBOutlet UITextField *celsiusTextField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topMarginConstraint;



@end

@implementation TemperatureVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

 - (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
 if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation)){
 self.topMarginConstraint.constant =60;
 }
 else {
 self.topMarginConstraint.constant  = 20;
 }
 
 }
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.fahrenheitTextField.delegate = self;
    self.celsiusTextField.delegate=self;
    [self.fahrenheitTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITextFieldDelegate methods

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]
                                             initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self.view action:@selector(endEditing:)];
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(textField == self.fahrenheitTextField){
        float fahrenheit = [text floatValue];
        float celsius = (fahrenheit-32)*5.0/9;
        self.celsiusTextField.text=[NSString stringWithFormat:@"%d",(int)round(celsius)];
    } else {
        float celsius = [text floatValue];
        float fahrenheit = (celsius*9.0)/5 - 32;
        self.fahrenheitTextField.text=[NSString stringWithFormat:@"%d",(int) round(fahrenheit)];
    }
    return YES;
}

@end
