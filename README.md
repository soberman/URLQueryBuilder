# NSURL+URLQueryBuilder

Fully Swift compatible handy category, that helps building GET queries with ease. All you need to do is to provide base URL and a dictionary of query items and get your already build NSURL as a return value.

``` objective-c
NSString *baseURL = @"https://google.com/search";
NSDictionary *items = @{
    @"q"  : @"arsenkin.com",
    @"hl" : @"en_US",
    @"lr" : @"lang_en"
};

NSURL *URL = [NSURL ars_queryWithString:baseURL queryElements:items];  
// https://google.com/search?q=arsenkin.com&hl=en_US&lr=lang_en
```

## Additional methods

URLQueryBuilder offers some more useful methods to create a ready URL for request.

###### Basic query creating  
There are two ways, in which you can provide base URL: via `NSString` object and via `NSURL` object. Here are the most basic classes for that:

``` objective-c
+ (NSURL *)ars_queryWithString:(NSString *)URL queryElements:(NSDictionary<NSString *,NSString *> *)queryElements;

+ (NSURL *)ars_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *,NSString *> *)queryElements;
```

###### Query creation with resolving against base URL
There are also ways to build your `NSURL` while resolving the URL agains base URL:

``` objective-c
+ (NSURL *)ars_queryWithString:(NSString *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve;

+ (NSURL *)ars_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve;
```

###### Query with pointer to NSURLComponents
There is also a way to create your desired `NSURL` object as well as receiving the resulting `NSURLComponents` object, that was used to create the resulting URL, that you might want for further use.

``` objective-c
+ (NSURL *)ars_queryWithString:(NSString *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent;

+ (NSURL *)ars_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent;
```

###### Ultimate methods
Aaaand as always - ultimate, super long uber-methods for building your mega query.

``` objective-c
+ (NSURL *)ars_queryWithString:(NSString *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent;

+ (NSURL *)ars_queryWithURL:(NSURL *)URL queryElements:(NSDictionary<NSString *, NSString *> *)queryElements resolveAgainstBaseURL:(BOOL)resolve URLComponent:(NSURLComponents * _Nullable * _Nullable)URLComponent;
```

## License
URLQueryBuilder is released under the [MIT license](http://opensource.org/licenses/MIT). See LICENSE for details.
