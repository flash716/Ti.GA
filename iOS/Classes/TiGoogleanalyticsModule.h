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

- (id)proxify:(id<GAITracker>)tracker;
- (void)closeTracker:(id)trackingId;
- (id)defaultTracker;
- (id)getTracker:(id)args;
- (id)optOut;
- (void)setOptOut:(id)value;
- (id)dryRun;
- (void)setDryRun:(id)value;
- (void)dispatch:(id)unused;
- (id)mapBuilder;
- (id)getMapBuilder:(id)args;
- (id)fields;
- (id)getFields:(id)args;
- (void)setLogLevel:(id)value;

@end