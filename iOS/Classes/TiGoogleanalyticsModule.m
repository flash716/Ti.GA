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
    
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelNone];
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

-(id)optOut
{
    return NUMBOOL([GAI sharedInstance].optOut);
}

- (void)setOptOut:(id)value
{
    ENSURE_SINGLE_ARG(value, NSObject);
    
    [GAI sharedInstance].optOut = [TiUtils boolValue:value];
}

- (id)dryRun
{
    return NUMBOOL([GAI sharedInstance].dryRun);
}

- (void)setDryRun:(id)value
{
    ENSURE_SINGLE_ARG(value, NSObject);
    
    [GAI sharedInstance].dryRun = [TiUtils boolValue:value];
}

- (void)dispatch:(id)unused
{
    [[GAI sharedInstance] dispatch];
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

- (id)getFields:(id)args
{
    return [self fields];
}

- (void)setLogLevel:(id)value
{
    ENSURE_SINGLE_ARG(value, NSObject);
    
    [[GAI sharedInstance].logger setLogLevel:[TiUtils intValue:value]];
}

@end