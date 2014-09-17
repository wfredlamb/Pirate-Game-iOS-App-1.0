//
//  CCViewController.m
//  Pirate Game App
//
//  Created by Wilson Lam on 8/26/14.
//  Copyright (c) 2014 Wilson Lam. All rights reserved.
//

#import "CCViewController.h"
#import "FactoryClass.h"
#import "Tile.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    FactoryClass *factory = [[FactoryClass alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    
    
    self.currentPoint = CGPointMake(0, 0);
    [self updateTile];
    [self updateButtons];
    [self updateCharacterStatsForArmor:nil withWeapon:nil withHealthEffect:0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

-(IBAction)actionButtonPressed:(UIButton *)sender

{
    Tile *tile = [[self.tiles objectAtIndex:self.currentPoint.x]objectAtIndex:self.currentPoint.y];
    if (tile.healthEffect == -15) {
        self.boss.health = self.boss.health - self.character.damamge;
    }
    
    [self updateCharacterStatsForArmor:tile.armor withWeapon:tile.weapon withHealthEffect:tile.healthEffect];
    
    if (self.character.health <= 0) {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died. Please retart the game!" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alertView show];
    }
    else if (self.boss.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory Message!" message: @"You have defeated the pirate boss!" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alertView show];
    }
    
    [self updateTile];
}


-(IBAction)northButtonPressed:(UIButton *)sender
{
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
}


-(IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateTile];
    [self updateButtons];
}


-(IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}


-(IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateTile];
    [self updateButtons];
}


- (IBAction)resetButtonPressed:(UIButton *)sender {
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

#pragma mark - helper methods

-(BOOL)tilesExistsAtPoint: (CGPoint)point
{
    if (point.x >= 0 && point.y >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    }
    else {
        return YES;
    }
}



-(void)updateButtons
{
    self.northButton.hidden = [self tilesExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y +1)];
    self.souhButton.hidden = [self tilesExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y -1)];
    self.eastButton.hidden = [self tilesExistsAtPoint:CGPointMake(self.currentPoint.x +1, self.currentPoint.y)];
    self.westButton.hidden = [self tilesExistsAtPoint:CGPointMake(self.currentPoint.x -1, self.currentPoint.y)];
    
}


-(void)updateTile
{
    Tile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damamge];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    
}


-(void)updateCharacterStatsForArmor: (Armor *)armor withWeapon: (Weapon *)weapon withHealthEffect: (int)healthEffect
{
    if (armor != nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil){
        
        self.character.damamge = self.character.damamge - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0) {
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damamge = self.character.damamge + self.character.weapon.damage;
    }
}




@end
