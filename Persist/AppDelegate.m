//
//  AppDelegate.m
//  Persist
//
//  Created by Thomas Mathews on 2015-03-28.
//
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (void)awakeFromNib {
    item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [item setImage:[NSImage imageNamed:@"StatusBarIcon"]];
    [item setMenu:menu];
    [item setHighlightMode:YES];
    
    windows = [[NSMutableArray alloc] init];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return NO;
}

- (void)closePic:(Pic*)window {
    [windows removeObject:window];
    window.picdel = nil;
    [window close];
}

- (void)closeAll:(id)sender {
    int count = (int)windows.count;
    for (int i=0; i<count;i++) {
        [self closePic:windows[i]];
        i--;
        count--;
    }
}

- (void)open:(id)sender {
    NSArray *filetypes = [[NSArray alloc] initWithObjects:@"png", @"jpg", @"jpeg", @"gif", nil];
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseDirectories:NO];
    [panel setCanChooseFiles:YES];
    [panel setAllowsMultipleSelection:NO];
    [panel setAllowedFileTypes:filetypes];
    int i = (int)[panel runModal];
    if (i != NSOKButton) {
        return;
    }
    
    NSImage *image = [[NSImage alloc] initWithContentsOfURL:[panel URL]];
    Pic *window = [[Pic alloc] initWithImage:image];
    window.picdel = self;
    [window makeKeyAndOrderFront:nil];
    [windows addObject:window];
}

@end
