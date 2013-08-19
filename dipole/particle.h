//
//  particle.h
//  dipole
//
//  Created by Timothy Chong on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface particle : NSObject
{
    double charge;
    CGPoint coor;
    double mass;
    double velocityX;
    double velocityY;
    double k;
    double scale;
    UIColor *color;
    double deltaVelocityX;
    double deltaVelocityY;
}

-(void) changeCoorX: (CGFloat) x Y: (CGFloat) y;
-(void) addResultantForceX: (CGFloat)x Y:(CGFloat)y;
-(CGPoint) getCoor;
-(id) initwithcharge: (double) cg coor: (CGPoint) cor mass:(double) m;
-(double) getCharge;
-(void) changeVelocity: (double) deltaX Y: (double) deltaY;
-(double) calculateAccelerationX: (CGPoint) point charge: (double)cg;
-(double) calculateAccelerationY: (CGPoint) point charge: (double)cg;
-(void) travel: (double) inc;
-(double) absolute:(double) num;
-(UIColor*) getColor;
-(UIColor *) randomColor;
-(double) getMass;
-(double) fieldAccelerationX: (double) field angle: (double) ang;
-(double) fieldAccelerationY: (double) field angle: (double) ang;
@end
