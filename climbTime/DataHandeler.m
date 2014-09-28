//
//  DataHandeler.m
//  climbTime
//
//  Created by Lasse Reedtz on 27/09/14.
//  Copyright (c) 2014 LasseInc. All rights reserved.
//

#import "DataHandeler.h"
#import <PodioKit/PodioKit.h>

@implementation DataHandeler

-(void)initConnection{
    [PodioKit setupWithAPIKey:@"im-going" secret:@"q6qTgOVAogiVySoIBhDw3BH8TvEWJILwHoGI1iYnEpUF56xN2IfTiBJoM63YjkG1"];
}




@end
