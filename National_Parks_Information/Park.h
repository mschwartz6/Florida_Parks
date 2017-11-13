
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Park : NSObject
@property(nonatomic,strong,getter=getParkName,setter=setParkName:)NSString *parkName;
@property(nonatomic,strong,getter=getParkLocation,setter=setParkLocation:)NSString *parkLocation;
@property(nonatomic,strong,getter=getParkThumbnail,setter=setParkThumbnail:)UIImage *parkThumbnail;
@property(nonatomic,strong,getter=getParkInfo,setter=setParkInfo:)NSString *parkInfo;
@property(nonatomic,strong,getter=getParkDirections,setter=setParkDirections:)NSString *parkDirections;
@property(nonatomic,strong,getter=getParkMap,setter=setParkMap:)UIImage *parkMap;
@property(nonatomic,strong,getter=getParkGallery,setter=setParkGallery:)NSMutableArray *parkGallery;
@property(nonatomic,strong,getter=getParkGalleryCaptions,setter=setParkGalleryCaptions:)NSArray *parkGalleryCaptions;
@property(nonatomic,strong,getter=getYearFounded,setter=setYearFounded:)NSString *yearFounded;
-(id)initWithName:(NSString*) name
     andWithLocation: (NSString*) location
     andWithThumbnail:(UIImage*) thumbnail
     andWithInfo: (NSString*)info
     andWithDirections: (NSString *)directions
     andWithMap:(UIImage *)map
     andWithGallery:(NSMutableArray *)gallery
     andWithGalleryCaptions:(NSArray *)galleryCaptions
     andWithYearFounded:(NSString *)yearFounded;
@end
