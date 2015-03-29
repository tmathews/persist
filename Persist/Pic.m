//
//  Pic.m
//  Persist
//
//  Created by Thomas Mathews on 2015-03-28.
//
//

#import "Pic.h"

@implementation Pic

@synthesize picdel;

- (id)initWithImage:(NSImage *)aimage {
    image = aimage;
    NSSize size = [image size];
    NSRect rect = NSMakeRect(0, 0, size.width, size.height);
    
    float maxSize = 420;
    if (size.height > maxSize) {
        rect.size.width = size.width * (maxSize / size.height);
        rect.size.height = maxSize;
    }
    
    if (self = [super initWithContentRect:NSMakeRect(50, 50, rect.size.width, rect.size.height) styleMask:(NSBorderlessWindowMask|NSResizableWindowMask) backing:NSBackingStoreBuffered defer:NO]) {
        view = [[Img alloc] initWithFrame:rect];
        [view setImage:image];
        [view setAutoresizingMask:(NSViewWidthSizable|NSViewHeightSizable)];
        [view setImageScaling:NSImageScaleAxesIndependently];
        
        [self.contentView addSubview:view];
        [self.contentView setAutoresizesSubviews:YES];
        
        [self setMovable:YES];
        [self setMovableByWindowBackground:YES];
        [self setReleasedWhenClosed:NO];
        [self setCollectionBehavior:NSWindowCollectionBehaviorManaged];
        [self setLevel: NSStatusWindowLevel];
        
        return self;
    }
    
    return nil;
}

- (NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize {
    NSSize size = [image size];
    float scale = size.width / size.height;
    
    if (frameSize.height < 100) {
        frameSize.height = 100;
    }
    
    frameSize.height = floorf(frameSize.height);
    frameSize.width = floorf(frameSize.height * scale);
    
    return frameSize;
}

- (void)keyDown:(NSEvent *)ev {
    if(([ev modifierFlags] & NSCommandKeyMask) != 0 && ev.keyCode == 13) {
        [picdel performSelector:@selector(closePic:) withObject:self];
    }
}

- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

@end
