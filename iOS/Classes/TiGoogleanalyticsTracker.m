//
//  TiGoogleanalyticsTracker.m
//  googleanalytics
//
//  Created by Dawson Toth on 8/19/13.
//
//

#import "TiGoogleanalyticsTracker.h"

@implementation TiGoogleanalyticsTracker

- (void)dealloc
{
    _tracker = nil;
    
	[super dealloc];
}

- (id)initWithTracker:(id<GAITracker>)tracker
{
    if (self = [super init])
    {
        _tracker = tracker;
    }
    
    return self;
}

#pragma mark Public API

- (id)get:(id)key
{
    ENSURE_SINGLE_ARG(key, NSString);
    
    return [self.tracker get:key];
}

- (void)set:(id)args
{
    ENSURE_ARG_COUNT(args, 2);
    
    NSString *key = nil;
    NSString *value = nil;
    
    ENSURE_ARG_AT_INDEX(key, args, 0, NSString);
    ENSURE_ARG_AT_INDEX(value, args, 1, NSString);
    
    [self.tracker set:key value:value];
}

- (void)send:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    [self.tracker send:args];
}

- (id)name
{
    return [self.tracker name];
}

@end