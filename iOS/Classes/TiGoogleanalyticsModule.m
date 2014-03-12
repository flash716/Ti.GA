//
//  TiGoogleanalyticsTracker.h
//  googleanalytics
//
//  Created by Dawson Toth on 8/19/13.
//
//

#import "TiGoogleanalyticsModule.h"

@implementation TiGoogleanalyticsModule

MAKE_SYSTEM_PROP(LOG_NONE, 0);    //kGAILogLevelNone
MAKE_SYSTEM_PROP(LOG_ERROR, 1);   //kGAILogLevelError
MAKE_SYSTEM_PROP(LOG_WARNING, 2); //kGAILogLevelWarning
MAKE_SYSTEM_PROP(LOG_INFO, 3);    //kGAILogLevelInfo
MAKE_SYSTEM_PROP(LOG_VERBOSE, 4); //kGAILogLevelVerbose

#pragma mark Internal

- (id)moduleGUID
{
	return @"d8446e59-4726-44a6-b1e9-a33d5cb4742f";
}

- (NSString*)moduleId
{
	return @"ti.googleanalytics";
}

#pragma mark Lifecycle

- (void)startup
{
	[super startup];
    
    [self setTrackUncaughtExceptions:NUMBOOL(YES)];
    [self setLogLevel:kGAILogLevelNone];
}

- (void)shutdown:(id)sender
{
	[[GAI sharedInstance] dispatch];
    
	[super shutdown:sender];
}

#pragma mark Utility

- (id)proxify:(id<GAITracker>)tracker
{
    return [[[TiGoogleanalyticsTracker alloc] initWithTracker:tracker] autorelease];
}

#pragma mark Public APIs

- (void)closeTracker:(id)trackingId
{
    ENSURE_SINGLE_ARG(trackingId, NSString);
    
    [[GAI sharedInstance] removeTrackerByName:trackingId];
}

- (id)defaultTracker
{
    return [self proxify:[GAI sharedInstance].defaultTracker];
}

- (id)getTracker:(id)args
{
    id<GAITracker> retVal;
    NSString *trackingId = nil;
    NSString *trackingName = nil;
    
    ENSURE_ARG_OR_NIL_AT_INDEX(trackingId, args, 1, NSString);
    
    if (trackingId != nil)
    {
        ENSURE_ARG_AT_INDEX(trackingName, args, 0, NSString);
        
        retVal = [[GAI sharedInstance] trackerWithName:trackingName trackingId:trackingId];
    }
    else
    {
        ENSURE_ARG_AT_INDEX(trackingId, args, 0, NSString);
        
        retVal = [[GAI sharedInstance] trackerWithTrackingId:trackingId];
    }
    
    return [self proxify:retVal];
}

- (void)dispatch:(id)unused
{
    [[GAI sharedInstance] dispatch];
}

#pragma mark Custom Accessors

- (id)optOut
{
    return NUMBOOL([[GAI sharedInstance] optOut]);
}

- (void)setOptOut:(id)value
{
    ENSURE_SINGLE_ARG(value, NSObject);
    
    [[GAI sharedInstance] setOptOut:[TiUtils boolValue:value]];
}

- (id)dryRun
{
    return NUMBOOL([[GAI sharedInstance] dryRun]);
}

- (void)setDryRun:(id)dryRun
{
    ENSURE_SINGLE_ARG(dryRun, NSObject);
    
    [[GAI sharedInstance] setDryRun:[TiUtils boolValue:dryRun]];
}

- (id)mapBuilder
{
    return [[[TiGoogleanalyticsMapBuilder alloc] init] autorelease];
}

- (id)getMapBuilder:(id)args
{
    return [self mapBuilder];
}

- (id)fields
{
    return [TiGoogleanalyticsFields fields];
}

- (id)getFields:(id)unused
{
    return [self fields];
}

#pragma mark Setter Overrides

- (void)setLogLevel:(NSNumber *)logLevel
{
    _logLevel = logLevel;
    
    [[[GAI sharedInstance] logger] setLogLevel:[logLevel integerValue]];
}

- (void)setDispatchInterval:(NSNumber *)dispatchInterval
{
    _dispatchInterval = dispatchInterval;
    
    [[GAI sharedInstance] setDispatchInterval:[dispatchInterval integerValue]];
}

- (void)setTrackUncaughtExceptions:(NSNumber *)trackUncaughtExceptions
{
    _trackUncaughtExceptions = trackUncaughtExceptions;
    
    [[GAI sharedInstance] setTrackUncaughtExceptions:[trackUncaughtExceptions boolValue]];
}

@end