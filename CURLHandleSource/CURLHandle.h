//
//  CURLHandle.h
//
//  Created by Dan Wood <dwood@karelia.com> on Fri Jun 22 2001.
//  This is in the public domain, but please report any improvements back to the author.

#import <Foundation/Foundation.h>
#import <curl/curl.h>


#ifndef CURLHandleLog
#define CURLHandleLog NSLog
#endif

@class CURLMulti;

@protocol CURLHandleDelegate;

enum { CURLM_CANCELLED = CURLM_LAST + 100 };

/*" YES if CURLHandle will allow use of a proxy server "*/
extern	BOOL				sAllowsProxy;

/*" Proxy User ID:Password combo for all uses of CURL. "*/
extern NSString				*sProxyUserIDAndPassword;

@interface CURLHandle : NSObject
{
	BOOL                    _cancelled;                     /*" A flag that is set by the foreground thread and read by the background thread; it's an indicator that the user has cancelled. "*/
	CURL                    *_curl;                         /*" Pointer to the actual CURL object that does all the hard work "*/
	id <CURLHandleDelegate> _delegate;
	char                    _errorBuffer[CURL_ERROR_SIZE];	/*" Buffer to hold string generated by CURL; this is then converted to an NSString. "*/
    BOOL                    _executing;                     // debugging
	NSMutableData           *_headerBuffer;                 /*" The buffer that is filled with data from the header as the download progresses; it's appended to one line at a time. "*/
    struct curl_slist       *_httpHeaders;
    struct curl_slist       *_postQuoteCommands;
	NSDictionary            *_proxies;                      /*" Dictionary of proxy information; it's released when the handle is deallocated since it's needed for the transfer."*/
	NSMutableDictionary     *_stringOptions;                /*" Dictionary of keys(ints) & values (NSStrings) for performing curl_easy_setopt.  We store the options in a dictionary and then invoke #curl_easy_setopt on each option right before the #curl_easy_perform so that we can retain their memory until it is needed."*/
    NSInputStream           *_uploadStream;
}

@property(nonatomic, assign) id <CURLHandleDelegate> delegate;

//  Loading respects as many of NSURLRequest's built-in features as possible, including:
//  
//    * An HTTP method of @"HEAD" turns on the CURLOPT_NOBODY option, regardless of protocol (e.g. handy for FTP)
//    * Similarly, @"PUT" turns on the CURLOPT_UPLOAD option (again handy for FTP uploads)
//  
//    * Supply -HTTPBody or -HTTPBodyStream to switch Curl into uploading mode, regardless of protocol
//  
//    * Custom Range: HTTP headers are specially handled to set the CURLOPT_RANGE option, regardless of protocol in use
//      (you should still construct the header as though it were HTTP, e.g. bytes=500-999)
//  
//    * Custom Accept-Encoding: HTTP headers are specially handled to set the CURLOPT_ENCODING option
//  
// Where possible errors are in NSURLErrorDomain or NSCocoaErrorDomain. There will generally be a CURLcodeErrorDomain error present; either directly, or as an underlying error (KSError <https://github.com/karelia/KSError> is handy for querying underlying errors)
// The key CURLINFO_RESPONSE_CODE (as an NSNumber) will be filled out with HTTP/FTP status code if appropriate
// At present all errors include NSURLErrorFailingURLErrorKey and NSURLErrorFailingURLStringErrorKey if applicable even though the docs say "This key is only present in the NSURLErrorDomain". Should we respect that?
- (BOOL)loadRequest:(NSURLRequest *)request error:(NSError **)error;


// Can be called from any thread. Causes -loadRequest:error: as soon as it can
- (void)cancel;

- (NSString *)initialFTPPath;    // CURLINFO_FTP_ENTRY_PATH
+ (NSString *)curlVersion;

@end

#pragma mark - RunLoop Support

@interface CURLHandle(RunLoopSupport)
- (BOOL)loadRequest:(NSURLRequest *)request withMulti:(CURLMulti*)multi;
- (void)completeWithCode:(CURLMcode)code withMulti:(CURLMulti*)multi;
@end

#pragma mark - Old API

@interface CURLHandle(OldAPI)
- (CURL *) curl;
- (void) setString:(NSString *)inString forKey:(CURLoption) inCurlOption;
+ (void) setProxyUserIDAndPassword:(NSString *)inString;
+ (void) setAllowsProxy:(BOOL) inBool;
@end

#pragma mark - Delegate

@protocol CURLHandleDelegate <NSObject>

- (void)handle:(CURLHandle *)handle didReceiveData:(NSData *)data;

@optional
- (void)handle:(CURLHandle *)handle didReceiveResponse:(NSURLResponse *)response;
- (void)handleDidFinish:(CURLHandle *)handle;
- (void)handle:(CURLHandle*)handle didFailWithError:(NSError*)error;

// When sending data to the server, this reports just before it goes out on the wire. Reports a length of 0 when the end of the data is written so you can get a nice heads up that an upload is about to complete
- (void)handle:(CURLHandle *)handle willSendBodyDataOfLength:(NSUInteger)bytesWritten;

- (void)handle:(CURLHandle *)handle didReceiveDebugInformation:(NSString *)string ofType:(curl_infotype)type;

@end

#pragma mark - Error Domains

extern NSString * const CURLcodeErrorDomain;
extern NSString * const CURLMcodeErrorDomain;
extern NSString * const CURLSHcodeErrorDomain;



