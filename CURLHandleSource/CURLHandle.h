//
//  CURLHandle.h
//
//  Created by Dan Wood <dwood@karelia.com> on Fri Jun 22 2001.
//  This is in the public domain, but please report any improvements back to the author.
//
//	The current version of CURLHandle is 1.9.
//

#import <Foundation/Foundation.h>
#import <curl/curl.h>

@protocol CURLHandleDelegate;


extern NSString * const CURLErrorDomain;

/*" YES if CURLHandle will allow use of a proxy server "*/
extern	BOOL				sAllowsProxy;

/*" Proxy User ID:Password combo for all uses of CURL. "*/
extern NSString				*sProxyUserIDAndPassword;

/*"	Callbacks from reading a chunk of data.  Since we pass "self" in as the "data pointer",
	we can use that to get back into Objective C and do the work with the class.
"*/

@class CURLHandle;
extern size_t curlBodyFunction(void *ptr, size_t size, size_t nmemb, void *inSelf);
extern size_t curlHeaderFunction(void *ptr, size_t size, size_t nmemb, void *inSelf);
extern size_t curlReadFunction(void *ptr, size_t size, size_t nmemb, CURLHandle *handle);
extern int curlDebugFunction(CURL *mCURL, curl_infotype infoType, char *info, size_t infoLength, CURLHandle *handle);

@interface CURLHandle : NSObject
{
	CURL			*mCURL;					/*" Pointer to the actual CURL object that does all the hard work "*/
	char 			mErrorBuffer[CURL_ERROR_SIZE];	/*" Buffer to hold string generated by CURL; this is then converted to an NSString. "*/
	int				mResult;				/*" Result after performing a CURL operation; it is displayed as an error code in case there was no error string generated. "*/

	NSMutableData   *_headerBuffer;			/*" The buffer that is filled with data from the header as the download progresses; it's appended to one line at a time. "*/

	NSMutableDictionary	*mStringOptions;	/*" Dictionary of keys(ints) & values (NSStrings) for performing curl_easy_setopt.  We store the options in a dictionary and then invoke #curl_easy_setopt on each option right before the #curl_easy_perform so that we can retain their memory until it is needed."*/

	NSDictionary	*mProxies;	/*" Dictionary of proxy information; it's released when the handle is deallocated since it's needed for the transfer."*/

	// Backgrounding support
	BOOL    _cancelled;		/*" A flag that is set by the foreground thread and read by the background thread; it's an indicator that the user has cancelled. "*/
    
    NSInputStream   *_uploadStream;

	FILE *mPutFile;  /*" The FILE stream if putFile: is used.  It's only saved so it can be closed after perform "*/
    
    id <CURLHandleDelegate> _delegate;
}

// Where possible errors are in NSURLErrorDomain or NSCocoaErrorDomain. There will generally be a CURLErrorDomain error present; either directly, or as an underlying error (KSError <https://github.com/karelia/KSError> is handy for querying underlying errors)
// The key CURLINFO_RESPONSE_CODE (as an NSNumber) will be filled out with HTTP/FTP status code if appropriate
// At present all errors include NSURLErrorFailingURLErrorKey and NSURLErrorFailingURLStringErrorKey if applicable even though the docs say "This key is only present in the NSURLErrorDomain". Should we respect that?
- (BOOL)loadRequest:(NSURLRequest *)request error:(NSError **)error;

@property(nonatomic, assign) id <CURLHandleDelegate> delegate;

+ (NSString *)curlVersion;

/*" Old API "*/

- (CURL *) curl;
- (void) setString:(NSString *)inString forKey:(CURLoption) inCurlOption;
- (void) setStringOrNumberObject:(id)inString forKey:(CURLoption) inCurlOption;
+ (void) setProxyUserIDAndPassword:(NSString *)inString;
+ (void) setAllowsProxy:(BOOL) inBool;
- (void) setPutFile:(NSString *)path;
- (void) setPutFileOffset:(int)offset;
- (void) setPutFile:(NSString *)path resumeUploadFromOffset:(off_t)offset_;

- (id)propertyForKey:(NSString *)propertyKey;
- (id)propertyForKeyIfAvailable:(NSString *)propertyKey;

/*" Support Methods "*/

- (size_t) curlWritePtr:(void *)inPtr size:(size_t)inSize number:(size_t)inNumber isHeader:(BOOL)header;
- (size_t) curlReadPtr:(void *)inPtr size:(size_t)inSize number:(size_t)inNumber;

@end


@protocol CURLHandleDelegate <NSObject>
- (void)handle:(CURLHandle *)handle didReceiveResponse:(NSURLResponse *)response;
- (void)handle:(CURLHandle *)handle didReceiveData:(NSData *)data;

@optional
- (void)handle:(CURLHandle *)handle didReceiveDebugInformation:(NSString *)string ofType:(curl_infotype)type;
@end


@interface NSDictionary ( CurlHTTPExtensions )

- (NSString *) formatForHTTP;
- (NSString *) formatForHTTPUsingEncoding:(NSStringEncoding)inEncoding;
- (NSString *) formatForHTTPUsingEncoding:(NSStringEncoding)inEncoding ordering:(NSArray *)inOrdering;

@end


