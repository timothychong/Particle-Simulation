//
//  particle.m
//  dipole
//
//  Created by Timothy Chong on 1/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "particle.h"

@implementation particle


-(void) changeCoorX: (CGFloat) x Y: (CGFloat) y
{
    coor.x = x;
    coor.y = y;
}

-(void) addResultantForceX: (CGFloat)x Y:(CGFloat)y
{
    CGFloat a;
    CGFloat b;
    
    a+= x;
    b+= y;
    
    [self changeCoorX:a Y:b];
}
-(CGPoint) getCoor
{
    return coor;
}
-(double) getCharge
{
    return charge;
}

-(double) getMass
{
    return mass;
    
}

-(id) initwithcharge: (double) cg coor: (CGPoint) cor mass:(double) m
{
    self = [super init];
    if (self) {
        coor = cor;
        charge = cg;
        velocityX = 0;
        velocityY = 0;
        mass =m;
        scale = 10000;
        k = 9* pow(10, -3);
        color = [self randomColor];
    }
    return self;
}

-(double) calculateAccelerationX: (CGPoint) point charge: (double)cg
{
    double force=0;
    double deltaX = (point.x - coor.x)/scale;
    double deltaY = (point.y - coor.y)/scale;
    double distanceSquare = pow(deltaX,2) + pow(deltaY, 2);
    double angle = atan(deltaY/deltaX);
    force = k * abs(cg) * abs(charge)/distanceSquare;
    double a=1;

    
    if((charge >= 0) ^ (cg < 0))
       a = -[self absolute:deltaX];
    else
        a = [self absolute:deltaX];
    return  a* abs(force * cos(angle)/mass);    
    
}

-(double) absolute:(double) num
{
    if( num <0)
        return -1;
    else
        return 1;
}

-(double) calculateAccelerationY: (CGPoint) point charge: (double)cg
{
    double force;
    double deltaX = (point.x - coor.x)/scale;
    double deltaY = (point.y - coor.y)/scale;
    double distanceSquare = pow(deltaX,2) + pow(deltaY, 2);
    double angle = atan(deltaY/deltaX);
    force = k * abs(cg) * abs(charge)/distanceSquare;
    double a = 1;
    if((charge >= 0) ^ (cg < 0))
        a = -[self absolute:deltaY];
    else
        a = [self absolute:deltaY];
   
    return  a*abs(force * sin(angle)/mass);
}

-(void) travel: (double) inc
{
    coor.x += velocityX * inc + 0.5 * deltaVelocityX * pow(inc,2);
    coor.y += velocityY * inc + 0.5 * deltaVelocityY * pow(inc,2);
    velocityX += deltaVelocityX * inc;
    velocityY += deltaVelocityY * inc;
}

-(void) changeVelocity: (double) deltaX Y: (double) deltaY
{
    deltaVelocityX =  deltaX;
    deltaVelocityY =  deltaY;
}

- (UIColor *) randomColor
{
	CGFloat red =  (CGFloat)random()/(CGFloat)RAND_MAX;
	CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
	CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    
	return [[UIColor alloc] initWithRed:red green:green blue:blue alpha:1.0];
}

-(UIColor*) getColor
{
    return color;
}
-(double) fieldAccelerationX: (double) field angle: (double) ang
{
    
    return field * charge /mass* cos(ang*2*M_PI/360);
    
}
-(double) fieldAccelerationY: (double) field angle: (double) ang
{
   
    return -field * charge /mass* sin(ang*2*M_PI/360);
}


@end
