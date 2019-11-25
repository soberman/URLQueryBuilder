//
//  NSURL+URLQueryBuilder.m
//  NSURLComponents
//
//  Created by Yaroslav Arsenkin on 26.10.15.
//  Copyright © 2015 Iaroslav Arsenkin. All rights reserved.
//  Website: http://arsenkin.com
//

#import "NSURL+URLQueryBuilder.h"

@implementation NSURL (URLQueryBuilder)

+ (NSURL *)ars_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *,NSString *> *)queryElements {
    return [self ars_queryWithURL:URL queryElements:queryElements resolveAgainstBaseURL:NO URLComponent:nil];
}

+ (NSURL *)ars_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve {
    return [self ars_queryWithURL:URL queryElements:queryElements resolveAgainstBaseURL:resolve URLComponent:nil];
}

+ (NSURL *)ars_removeQueryWithURL:(NSURL *)URL queryKeys:(NSArray<NSString *> *)queryKeys {
    return [self ars_removeQueryWithURL:URL queryKeys:queryKeys resolveAgainstBaseURL:NO URLComponent:nil];
}

+ (NSURL *)ars_removeQueryWithURL:(NSURL *)URL queryKeys:(NSArray<NSString *> *)queryKeys resolveAgainstBaseURL:(BOOL)resolve {
    return [self ars_removeQueryWithURL:URL queryKeys:queryKeys resolveAgainstBaseURL:resolve URLComponent:nil];
}

#pragma mark W/ Pointer to URLComponent

+ (NSURL *)ars_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *,NSString *> *)queryElements URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [self ars_queryWithURL:URL queryElements:queryElements resolveAgainstBaseURL:NO URLComponent:URLComponent];
}

+ (NSURL *)ars_removeQueryWithURL:(NSURL *)URL queryKeys:(NSArray<NSString *> *)queryKeys URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [self ars_removeQueryWithURL:URL queryKeys:queryKeys resolveAgainstBaseURL:NO URLComponent:URLComponent];
}

#pragma mark Main Method

+ (NSURL *)ars_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    NSMutableArray<NSURLQueryItem *> *mQueryItems = [NSMutableArray array];
    for (NSString *key in queryElements) {
        NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:key value:queryElements[key]];
        [mQueryItems addObject:queryItem];
    }
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:resolve];
    components.queryItems = components.queryItems ?: @[];
    components.queryItems = [components.queryItems arrayByAddingObjectsFromArray:mQueryItems];
    
    if (URLComponent) {
        *URLComponent = components;
    }
    return components.URL;
}

+ (NSURL *)ars_removeQueryWithURL:(NSURL *)URL queryKeys:(NSArray<NSString *> *)queryKeys resolveAgainstBaseURL:(BOOL)resolve URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    NSURLComponents *components = [NSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:resolve];
    NSMutableArray<NSURLQueryItem *> *mQueryItems = components.queryItems.mutableCopy;
    
    for (int i = 0; i < components.queryItems.count; ++i) {
        if ([queryKeys indexOfObject:components.queryItems[i].name] != NSNotFound) {
            [mQueryItems removeObject:components.queryItems[i]];
        }
    }
    
    components.queryItems = mQueryItems.count == 0 ? nil : mQueryItems;
    
    if (URLComponent) {
        *URLComponent = components;
    }
    return components.URL;
}

+ (NSDictionary *)ars_queryDictionaryWithURL:(NSURL *)URL {
    NSMutableDictionary *mQueryDictionary = [NSMutableDictionary dictionary];
    NSURLComponents *components = [NSURLComponents componentsWithURL:URL resolvingAgainstBaseURL:false];
    for (NSURLQueryItem *item in components.queryItems) {
        [mQueryDictionary setObject:item.value forKey:item.name];
    }
    return mQueryDictionary;
}

- (NSDictionary *)ars_queryDictionary {
    return [NSURL ars_queryDictionaryWithURL:self];
}

- (NSURL *)ars_queryElements:(NSDictionary<NSString *,NSString *> *)queryElements {
    return [NSURL ars_queryWithURL:self queryElements:queryElements];
}

- (NSURL *)ars_queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve {
    return [NSURL ars_queryWithURL:self queryElements:queryElements resolveAgainstBaseURL:resolve];
}

- (NSURL *)ars_queryElements:(NSDictionary<NSString *, NSString *> *)queryElements URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [NSURL ars_queryWithURL:self queryElements:queryElements URLComponent:URLComponent];
}

- (NSURL *)ars_queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent
{
    return [NSURL ars_queryWithURL:self queryElements:queryElements resolveAgainstBaseURL:resolve URLComponent:URLComponent];
}

- (NSURL *)ars_removeQueryKeys:(NSArray<NSString *> *)queryKeys
{
    return [NSURL ars_removeQueryWithURL:self queryKeys:queryKeys];
}

- (NSURL *)ars_removeQueryKeys:(NSArray<NSString *> *)queryKeys resolveAgainstBaseURL:(BOOL)resolve
{
    return [NSURL ars_removeQueryWithURL:self queryKeys:queryKeys resolveAgainstBaseURL:resolve];
}

- (NSURL *)ars_removeQueryKeys:(NSArray<NSString *> *)queryKeys URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent
{
    return [NSURL ars_removeQueryWithURL:self queryKeys:queryKeys URLComponent:URLComponent];
}

- (NSURL *)ars_removeQueryKeys:(NSArray<NSString *> *)queryKeys resolveAgainstBaseURL:(BOOL)resolve URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [NSURL ars_removeQueryWithURL:self queryKeys:queryKeys resolveAgainstBaseURL:resolve URLComponent:URLComponent];
}

@end


@implementation NSString (URLQueryBuilder)

+ (NSString *)ars_queryWithURLString:(NSString *)URLString queryElements:(NSDictionary<NSString *,NSString *> *)queryElements {
    return [self ars_queryWithURLString:URLString queryElements:queryElements resolveAgainstBaseURL:NO URLComponent:nil];
}

+ (NSString *)ars_queryWithURLString:(NSString *)URLString queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve {
    return [self ars_queryWithURLString:URLString queryElements:queryElements resolveAgainstBaseURL:resolve URLComponent:nil];
}

+ (NSString *)ars_queryWithURLString:(NSString *)URLString queryElements:(NSDictionary<NSString *,NSString *> *)queryElements URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [self ars_queryWithURLString:URLString queryElements:queryElements resolveAgainstBaseURL:NO URLComponent:URLComponent];
}

+ (NSString *)ars_removeQueryWithURLString:(NSString *)URLString queryKeys:(NSArray<NSString *> *)queryKeys {
    return [self ars_removeQueryWithURLString:URLString queryKeys:queryKeys resolveAgainstBaseURL:NO URLComponent:nil];
}

+ (NSString *)ars_removeQueryWithURLString:(NSString *)URLString queryKeys:(NSArray<NSString *> *)queryKeys resolveAgainstBaseURL:(BOOL)resolve {
    return [self ars_removeQueryWithURLString:URLString queryKeys:queryKeys resolveAgainstBaseURL:resolve URLComponent:nil];
}

+ (NSString *)ars_removeQueryWithURLString:(NSString *)URLString queryKeys:(NSArray<NSString *> *)queryKeys URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [self ars_removeQueryWithURLString:URLString queryKeys:queryKeys resolveAgainstBaseURL:false URLComponent:nil];
}

+ (NSString *)ars_queryWithURLString:(NSString *)URLString queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [NSURL ars_queryWithURL:[NSURL URLWithString:URLString] queryElements:queryElements resolveAgainstBaseURL:resolve URLComponent:URLComponent].absoluteString;
}

+ (NSString *)ars_removeQueryWithURLString:(NSString *)URLString queryKeys:(NSArray<NSString *> *)queryKeys resolveAgainstBaseURL:(BOOL)resolve URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [NSURL ars_removeQueryWithURL:[NSURL URLWithString:URLString] queryKeys:queryKeys resolveAgainstBaseURL:resolve URLComponent:URLComponent].absoluteString;
}

+ (NSDictionary *)ars_queryDictionaryWithURL:(NSString *)URLString {
    return [NSURL ars_queryDictionaryWithURL:[NSURL URLWithString:URLString]];
}

- (NSDictionary *)ars_queryDictionary {
    return [NSString ars_queryDictionaryWithURL:self];
}

- (NSString *)ars_queryElements:(NSDictionary<NSString *,NSString *> *)queryElements {
    return [NSString ars_queryWithURLString:self queryElements:queryElements];
}

- (NSString *)ars_queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve {
    return [NSString ars_queryWithURLString:self queryElements:queryElements resolveAgainstBaseURL:resolve];
}

- (NSString *)ars_queryElements:(NSDictionary<NSString *, NSString *> *)queryElements URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [NSString ars_queryWithURLString:self queryElements:queryElements URLComponent:URLComponent];
}

- (NSString *)ars_removeQueryKeys:(NSArray<NSString *> *)queryKeys
{
    return [self ars_removeQueryKeys:queryKeys resolveAgainstBaseURL:false URLComponent:nil];
}

- (NSString *)ars_removeQueryKeys:(NSArray<NSString *> *)queryKeys resolveAgainstBaseURL:(BOOL)resolve
{
    return [self ars_removeQueryKeys:queryKeys resolveAgainstBaseURL:resolve URLComponent:nil];
}

- (NSString *)ars_removeQueryKeys:(NSArray<NSString *> *)queryKeys URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [self ars_removeQueryKeys:queryKeys resolveAgainstBaseURL:false URLComponent:URLComponent];
}

- (NSString *)ars_removeQueryKeys:(NSArray<NSString *> *)queryKeys resolveAgainstBaseURL:(BOOL)resolve URLComponent:( NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [NSURL ars_removeQueryWithURL:[NSURL URLWithString:self] queryKeys:queryKeys resolveAgainstBaseURL:resolve URLComponent:URLComponent].absoluteString;
}

- (NSString *)ars_queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve URLComponent:( NSURLComponents * _Nullable * _Nullable)URLComponent {
    return [NSString ars_queryWithURLString:self queryElements:queryElements resolveAgainstBaseURL:resolve URLComponent:URLComponent];
}

@end
