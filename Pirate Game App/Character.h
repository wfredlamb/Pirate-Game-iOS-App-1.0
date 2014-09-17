//
//  Character.h
//  Pirate Game App
//
//  Created by Wilson Lam on 9/6/14.
//  Copyright (c) 2014 Wilson Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Armor.h"
#import "Weapon.h"

@interface Character : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damamge;
@property (strong, nonatomic) Armor *armor;
@property (strong, nonatomic) Weapon *weapon;


@end
