//
//  TiGoogleanalyticsTracker.h
//  googleanalytics
//
//  Created by Dawson Toth on 8/19/13.
//
//

#import "GAI.h"
#import "TiModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiGoogleanalyticsTracker.h"
#import "TiGoogleanalyticsFields.h"
#import "TiGoogleanalyticsMapBuilder.h"

@interface TiGoogleanalyticsModule : TiModule

@property (nonatomic, readwrite, assign) NSNumber* trackUncaughtExceptions;
@property (nonatomic, readwrite, assign) NSNumber* dispatchInterval;
@property (nonatomic, readwrite, assign) NSNumber* logLevel;

- (id)proxify:(id<GAITracker>)tracker;
- (void)closeTracker:(id)trackingId;
- (id)defaultTracker;
- (id)getTracker:(id)args;
- (id)optOut;
- (void)setOptOut:(id)value;
- (id)dryRun;
- (void)setDryRun:(id)value;
- (id)mapBuilder;
- (id)getMapBuilder:(id)args;
- (id)fields;
- (id)getFields:(id)args;
- (void)setLogLevel:(NSNumber *)logLevel;
- (void)setDispatchInterval:(NSNumber *)dispatchInterval;
- (void)setTrackUncaughtExceptions:(NSNumber *)trackUncaughtExceptions;

@end