//
//  TiGoogleanalyticsTracker.h
//  googleanalytics
//
//  Created by Dawson Toth on 8/19/13.
//
//

@interface TiGoogleanalyticsModuleAssets : NSObject

- (NSData*) moduleAsset;
- (NSData*) resolveModuleAsset:(NSString*)path;

@end