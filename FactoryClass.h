//
//  FactoryClass.h
//  Pirate Game App
//
//  Created by Wilson Lam on 8/26/14.
//  Copyright (c) 2014 Wilson Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Boss.h"

@interface FactoryClass : NSObject


-(NSArray *)tiles;
-(Character *)character;
-(Boss *)boss;


@end
