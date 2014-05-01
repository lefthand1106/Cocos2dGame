//
//  NewScene.m
//  Cocos2dGame
//
//  Created by 篠原正樹 on 2014/04/28.
//  Copyright 2014年 masakishinohara. All rights reserved.
//

#import "NewScene.h"
#import "HelloWorldLayer.h"

@implementation NewScene

+(CCScene *)scene
{
    CCScene *scene =[CCScene node];
    
    NewScene * layer = [NewScene node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init
{
    if (self = [super init]) {
        
        
        /*レイヤーA*/
        
        CCLayer * layerA = [CCLayer node];
        
        [self addChild:layerA];
        
        CCSprite * sampleSprite = [CCSprite spriteWithFile:@"calc_icon&48.png"];
        
        // ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        sampleSprite.position = CGPointMake(size.width / 2, size.height / 2);
        
        [layerA addChild:sampleSprite];
        
        id rotate = [CCRotateBy actionWithDuration:10 angle:360];
        
        id roop = [CCRepeatForever actionWithAction:rotate];
        
        [layerA runAction:roop];
        
        
        
        /*レイヤーB*/
        
        CCLayer *layerB = [CCLayer node];
        
        [self addChild:layerB];
        
        [CCMenuItemFont setFontName:@"Helvetica-BoldOblique"];
        
        [CCMenuItemFont setFontSize:40];
        
       // CCMenuItemFont * item = [CCMenuItemFont itemWithString:@"戻る" block:^(id sender){
            
         //   CCTransitionFade * tran = [CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccc3(255, 255, 255)];
            
            
           // [[CCDirector sharedDirector] replaceScene:tran];
       // }];
        
        CCMenuItemImage * item2 = [CCMenuItemImage itemWithNormalImage:@"air_signal_icon&48.png" selectedImage:@"align_just_icon&48.png" disabledImage:@"app_window_cross_icon&48.png" block:^(id sender){
   
        CCLOG(@"CCMenuItemImage selected.");
    }];
        
        NSArray * toggleMenuItems = [NSArray arrayWithObjects:[CCMenuItemFont itemWithString:@"ON"],
                                     [CCMenuItemFont itemWithString:@"OFF"],
                                     nil];
        CCMenuItemToggle *item3 = [CCMenuItemToggle itemWithItems:toggleMenuItems block:^(id sender){
            CCLOG(@"CCMenuItemToggle selected");
        }];
    
    
        
        CCMenu * menu = [CCMenu menuWithItems:item2, item3, nil];
     //menu.position = CGPointMake(size.width / 2, size.height / 2 - 60);
        [menu alignItemsVerticallyWithPadding:10.0];
        
        [layerB addChild:menu];

        
        item2.isEnabled = NO;
        
    }
    return self;
}



@end
