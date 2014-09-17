//
//  Tile.h
//  Pirate Game App
//
//  Created by Wilson Lam on 8/26/14.
//  Copyright (c) 2014 Wilson Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Armor.h"
#import "Weapon.h"

@interface Tile : NSObject

@property (strong, nonatomic) NSString *story;
@property (nonatomic, strong) NSString *actionButtonName;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) Weapon *weapon;
@property (strong, nonatomic) Armor *armor;
@property (nonatomic) int healthEffect;

@end
