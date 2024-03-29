//
//  FactoryClass.m
//  Pirate Game App
//
//  Created by  on 8/26/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "FactoryClass.h"
#import "Tile.h"

@implementation FactoryClass

-(NSArray *)tiles{
    
    Tile *tile1 = [[Tile alloc] init];
    tile1.story = @"Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword to get started?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    Weapon *bluntedSword = [[Weapon alloc] init];
    bluntedSword.name =@"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Take Sword!";
    
    
    Tile *tile2 = [[Tile alloc] init];
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor to steel?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    Armor *steelArmor = [[Armor alloc] init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.actionButtonName = @"Take Steel Armor!";
    
    
    Tile *tile3 = [[Tile alloc] init];
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed: @"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 12;
    tile3.actionButtonName = @"Stop at Dock.";
    
    
    Tile *tile4 = [[Tile alloc] init];
    tile4.story = @"You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    Armor *parrotArmor = [[Armor alloc] init];
    parrotArmor.name = @"Parrot";
    parrotArmor.health = 20;
    tile4.armor = parrotArmor;
    tile4.actionButtonName = @"Adopt Parrot!";
    
    
    Tile *tile5 = [[Tile alloc] init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    Weapon *pistolWeapon = [[Weapon alloc]init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 17;
    tile5.actionButtonName = @"Use pistol.";
    
    
    Tile *tile6 = [[Tile alloc] init];
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank.";
    tile6.backgroundImage = [UIImage imageNamed: @"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    tile6.actionButtonName =@"Show no fear!";
    
    Tile *tile7 = [[Tile alloc] init];
    tile7.story = @"You sight a pirate battle off the coast.";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 8;
    tile7.actionButtonName = @"Fight those scum!";
    
    
    Tile *tile8 = [[Tile alloc] init];
    tile8.story = @"The legend of the deep, the mighty kraken appears.";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -46;
    tile8.actionButtonName =@"Abandon ship!";
    
    
    Tile *tile9 = [[Tile alloc] init];
    tile9.story = @"You stumble upon a hidden cave of pirate treasures.";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 20;
    tile9.actionButtonName = @"Take treasurer.";
    
    
    Tile *tile10 = [[Tile alloc] init];
    tile10.story = @"A group of pirates attempts to board your ship!";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -15;
    tile10.actionButtonName = @"Repel the invaders";
                             
    Tile *tile11 = [[Tile alloc] init];
    tile11.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage =[UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7;
    tile11.actionButtonName = @"Swim deeper.";
    
    
    Tile *tile12 = [[Tile alloc] init];
    tile12.story = @"Youre final faceoff with the fearsome pirate boss!!!!!";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"FIGHT!";

    
    
    NSArray *columnArray1 = [[NSArray alloc] initWithObjects:tile1,tile2,tile3, nil];
    NSArray *column2Array = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    
    NSArray *column3Array = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    
    NSArray *column4Array = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:columnArray1, column2Array, column3Array, column4Array, nil];
    
    return tiles;
    
}

-(Character *)character
{
    Character *character = [[Character alloc] init];
    character.health = 100;
    
    Armor *armor = [[Armor alloc] init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = @"Fist of Fury";
    weapon.damage = 10;
    character.weapon = weapon; 

    return character;
}


-(Boss *)boss
{
    Boss *boss = [[Boss alloc] init];
    boss.health = 65;
    return boss;
    
}

@end
