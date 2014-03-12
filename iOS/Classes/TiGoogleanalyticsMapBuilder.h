//
//  TiGoogleanalyticsMapBuilder.h
//  googleanalytics
//
//  Created by Dawson Toth on 8/19/13.
//
//

#import "GAIDictionaryBuilder.h"
#import "TiProxy.h"

@interface TiGoogleanalyticsMapBuilder : TiProxy

@property (nonatomic, readwrite, retain) GAIDictionaryBuilder *db;

- (id)createAppView:(id)args;
- (id)createEvent:(id)args;
- (id)createException:(id)args;
- (id)createItem:(id)args;
- (id)createSocial:(id)args;
- (id)createTiming:(id)args;
- (id)createTransaction:(id)args;
- (id)build:(id)args;
- (id)get:(id)paramName;
- (id)set:(id)args;
- (id)setAll:(id)args;
- (id)setCampaignParamsFromUrl:(id)utmParams;

@end