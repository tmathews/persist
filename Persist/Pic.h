//
//  Pic.h
//  Persist
//
//  Created by Thomas Mathews on 2015-03-28.
//
//

#import <Cocoa/Cocoa.h>
#import "Img.h"

@protocol PicDel;

@interface Pic : NSWindow <NSWindowDelegate> {
    NSImage *image;
    NSImageView *view;
    id picdel;
}

@property (strong) id<PicDel> picdel;

- (id)initWithImage:(NSImage*)image;

@end

@protocol PicDel <NSObject>
@required
-(void)closePic:(Pic*)pic;
@end