//
//  ViewController.m
//  dipole
//
//  Created by Timothy Chong on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


-(IBAction)startPlaying:(id)sender
{
    [sc addParticleWithX:[[xCor text]doubleValue]  y:[[yCor text]doubleValue] mass:[[mass text]doubleValue] charge:[[charge text]doubleValue]];
    deleteLast.hidden = NO;
    [self hideKeyboard];
}

-(IBAction)stop:(id)sender
{
    [timer invalidate];
    timer = nil;
    stop.hidden = YES;
    play.hidden = NO;
    [self hideKeyboard];
}

-(IBAction)Play:(id)sender
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:sc selector:@selector(evoleOneSecond) userInfo:nil repeats:YES];
    stop.hidden = NO;
    play.hidden = YES;
    [self hideKeyboard];
}
-(IBAction)clearEverything:(id)sender
{
    [self hideKeyboard];
    [sc clear];
    deleteLast.hidden = YES;
    
    [sc setNeedsDisplay];
}
-(IBAction)deleteLast:(id)sender
{
    if([sc deleteLastObject])
        deleteLast.hidden = YES;
    [self hideKeyboard];
    [sc setNeedsDisplay];
}
-(IBAction)setField:(id)sender
{
    [sc setFieldWithCharge:[[fieldCharge text]doubleValue] angle:[[angle text]doubleValue]];
    setField.hidden = YES;
    clearField.hidden = NO;
    [self hideKeyboard];
}
-(IBAction)clearField:(id)sender
{
    [sc clearField];
    setField.hidden = NO;
    clearField.hidden = YES;
    [self hideKeyboard];

}
-(void) hideKeyboard
{
    [angle resignFirstResponder];
    [mass resignFirstResponder];
    [xCor resignFirstResponder];
    [yCor resignFirstResponder];
    [fieldCharge resignFirstResponder];
    [charge resignFirstResponder];
    
    
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [sc startUp];
    stop.hidden = YES;
    deleteLast.hidden = YES;
      clearField.hidden = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
