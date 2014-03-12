//
//  TiGoogleanalyticsMapBuilder.m
//  googleanalytics
//
//  Created by Dawson Toth on 8/19/13.
//
//

#import "TiGoogleanalyticsMapBuilder.h"

@implementation TiGoogleanalyticsMapBuilder

- (void)dealloc
{
    RELEASE_TO_NIL_AUTORELEASE(_db);
    
	[super dealloc];
}

- (id)createAppView:(id)args
{
    RELEASE_AND_REPLACE(_db, [GAIDictionaryBuilder createAppView]);
    
    return self;
}

- (id)createEvent:(id)args
{
    NSString *category = nil;
    NSString *action = nil;
    NSString *label = nil;
    NSNumber *value = nil;
    
    ENSURE_ARG_AT_INDEX(category, args, 0, NSString);
    ENSURE_ARG_AT_INDEX(action, args, 1, NSString);
    ENSURE_ARG_OR_NIL_AT_INDEX(label, args, 2, NSString);
    ENSURE_ARG_OR_NIL_AT_INDEX(value, args, 3, NSNumber);
    
    RELEASE_AND_REPLACE(_db, [GAIDictionaryBuilder createEventWithCategory:category
                                                                    action:action
                                                                     label:label
                                                                     value:value]);
    
    return self;
}

- (id)createException:(id)args
{
    NSString *exceptionDescription = nil;
    NSNumber *fatal = nil;
    
    ENSURE_ARG_AT_INDEX(exceptionDescription, args, 0, NSString);
    ENSURE_ARG_AT_INDEX(fatal, args, 1, NSNumber);
    
    RELEASE_AND_REPLACE(_db, [GAIDictionaryBuilder createExceptionWithDescription:exceptionDescription
                                                                        withFatal:fatal]);
    
    return self;
}

- (id)createItem:(id)args
{
    NSString *transactionId = nil;
    NSString *name = nil;
    NSString *sku = nil;
    NSString *category = nil;
    NSNumber *price = nil;
    NSNumber *quantity = nil;
    NSString *currencyCode = nil;
    
    ENSURE_ARG_AT_INDEX(transactionId, args, 0, NSString);
    ENSURE_ARG_AT_INDEX(name, args, 1, NSString);
    ENSURE_ARG_AT_INDEX(sku, args, 2, NSString);
    ENSURE_ARG_AT_INDEX(category, args, 3, NSString);
    ENSURE_ARG_AT_INDEX(price, args, 4, NSNumber);
    ENSURE_ARG_AT_INDEX(quantity, args, 5, NSNumber);
    ENSURE_ARG_OR_NIL_AT_INDEX(currencyCode, args, 6, NSString);
    
    RELEASE_AND_REPLACE(_db, [GAIDictionaryBuilder createItemWithTransactionId:transactionId
                                                                          name:name
                                                                           sku:sku
                                                                      category:category
                                                                         price:price
                                                                      quantity:quantity
                                                                  currencyCode:currencyCode]);
    
    return self;
}

- (id)createSocial:(id)args
{
    NSString *network = nil;
    NSString *action = nil;
    NSString *target = nil;
    
    ENSURE_ARG_AT_INDEX(network, args, 0, NSString);
    ENSURE_ARG_AT_INDEX(action, args, 1, NSString);
    ENSURE_ARG_OR_NIL_AT_INDEX(target, args, 2, NSString);
    
    RELEASE_AND_REPLACE(_db, [GAIDictionaryBuilder createSocialWithNetwork:network
                                                                    action:action
                                                                    target:target]);
    return self;
}

- (id)createTiming:(id)args
{
    NSString *category = nil;
    NSNumber *intervalInMilliseconds = nil;
    NSString *name = nil;
    NSString *label = nil;
    
    ENSURE_ARG_AT_INDEX(category, args, 0, NSString);
    ENSURE_ARG_AT_INDEX(intervalInMilliseconds, args, 1, NSNumber);
    ENSURE_ARG_AT_INDEX(name, args, 2, NSString);
    ENSURE_ARG_OR_NIL_AT_INDEX(label, args, 3, NSString);
    
    RELEASE_AND_REPLACE(_db, [GAIDictionaryBuilder createTimingWithCategory:category
                                                                   interval:intervalInMilliseconds
                                                                       name:name
                                                                      label:label]);
    
    return self;
}

- (id)createTransaction:(id)args
{
    NSString *transactionId = nil;
    NSString *affiliation = nil;
    NSNumber *revenue = nil;
    NSNumber *tax = nil;
    NSNumber *shipping = nil;
    NSString *currencyCode = nil;
    
    ENSURE_ARG_AT_INDEX(transactionId, args, 0, NSString);
    ENSURE_ARG_OR_NIL_AT_INDEX(affiliation, args, 1, NSString);
    ENSURE_ARG_AT_INDEX(revenue, args, 2, NSNumber);
    ENSURE_ARG_OR_NIL_AT_INDEX(tax, args, 3, NSNumber);
    ENSURE_ARG_OR_NIL_AT_INDEX(shipping, args, 4, NSNumber);
    ENSURE_ARG_OR_NIL_AT_INDEX(currencyCode, args, 5, NSString);
    
    RELEASE_AND_REPLACE(_db, [GAIDictionaryBuilder createTransactionWithId:transactionId
                                                               affiliation:affiliation
                                                                   revenue:revenue
                                                                       tax:tax
                                                                  shipping:shipping
                                                              currencyCode:currencyCode]);
    
    return self;
}

- (id)build:(id)args
{
    return [self.db build];
}

- (id)get:(id)paramName
{
    ENSURE_SINGLE_ARG(paramName, NSString);
    
    return [self.db get:paramName];
}

- (id)set:(id)args
{
    NSString *paramName = nil;
    NSString *paramValue = nil;
    
    ENSURE_ARG_AT_INDEX(paramName, args, 0, NSString);
    ENSURE_ARG_AT_INDEX(paramValue, args, 1, NSString);
    
    [self.db set:paramValue forKey:paramName];
    
    return self;
}

- (id)setAll:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    [self.db setAll:args];
    
    return self;
}


- (id)setCampaignParamsFromUrl:(id)utmParams
{
    ENSURE_SINGLE_ARG(utmParams, NSString);
    
    [self.db setCampaignParametersFromUrl:utmParams];
    
    return self;
}

@end