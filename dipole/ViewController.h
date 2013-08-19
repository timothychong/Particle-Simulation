//
//  ViewController.h
//  dipole
//
//  Created by Timothy Chong on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "screen.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField * mass;
    IBOutlet UITextField * xCor;
    IBOutlet UITextField * yCor;
    IBOutlet UITextField * charge;
    IBOutlet UITextField * fieldCharge;
    IBOutlet UITextField * angle;
    
    IBOutlet screen *sc;
    IBOutlet UIButton *stop;
    IBOutlet UIButton *setField;
    IBOutlet UIButton *clearField;
    IBOutlet UIButton *play;
    IBOutlet UIButton *deleteLast;
    double speed;
    NSTimer *timer;
}

-(IBAction)startPlaying:(id)sender;
-(IBAction)Play:(id)sender;
-(IBAction)clearEverything:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)deleteLast:(id)sender;
-(IBAction)setField:(id)sender;
-(IBAction)clearField:(id)sender;
-(void) hideKeyboard;

@end
