/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 The Application Delegate.
 */

#import "AppDelegate.h"
#import "GLViewController.h"
#import "MetalViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSWindow* mainWindow = [[NSApplication sharedApplication]mainWindow];

    NSString* error = [[mainWindow contentViewController] getError];
    if(error != nil)
    {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"Failed to start the application"];
        [alert setInformativeText:error];
        [alert setAlertStyle:NSAlertStyleCritical];
        [alert runModal];
        [NSApp terminate:self];
    }

    [mainWindow setAcceptsMouseMovedEvents:YES];
    NSString *name =  [[mainWindow contentViewController] getAppName];
    if(name != nil)
    {
        [mainWindow setTitle:name];
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

@end
