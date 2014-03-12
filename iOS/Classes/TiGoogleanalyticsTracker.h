//
//  TiGoogleanalyticsTracker.h
//  googleanalytics
//
//  Created by Dawson Toth on 8/19/13.
//
//

#import "GAITracker.h"
#import "TiProxy.h"

@interface TiGoogleanalyticsTracker : TiProxy

@property (nonatomic, readonly, assign) id<GAITracker> tracker;

- (id)initWithTracker:(id<GAITracker>)tracker;
- (id)get:(id)key;
- (void)set:(id)args;
- (void)send:(id)args;
- (id)name;

@end