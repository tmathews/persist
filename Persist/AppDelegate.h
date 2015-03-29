//
//  AppDelegate.h
//  Persist
//
//  Created by Thomas Mathews on 2015-03-28.
//
//

#import <Cocoa/Cocoa.h>
#import "Pic.h"

@class Pic;

@interface AppDelegate : NSObject <NSApplicationDelegate, PicDel> {
    IBOutlet NSMenu *menu;
    NSStatusItem *item;
    NSMutableArray *windows;
}

- (IBAction)open:(id)sender;
- (IBAction)closeAll:(id)sender;
- (void)closePic:(Pic*)window;

@end

