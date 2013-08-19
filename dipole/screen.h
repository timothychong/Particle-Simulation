//
//  screen.h
//  dipole
//
//  Created by Timothy Chong on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "particle.h"

@interface screen : UIView 
{
    NSMutableArray * particles;
    double timeinc;
    BOOL haveField;
    double fieldAngle;
    double fieldCharge;
}
-(void) addParticleWithX: (double) x y: (double) y mass:(double)m charge: (double) cg;
-(void) evoleOneSecond;
-(void) startUp;
-(void) clear;
-(BOOL) deleteLastObject;
-(void) setFieldWithCharge: (double)cg angle: (double) ang;
-(void) clearField;
@end
