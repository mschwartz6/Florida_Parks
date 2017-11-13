

#import "Park.h"

@implementation Park
-(id)initWithName:(NSString *)name andWithLocation:(NSString *)location andWithThumbnail:(UIImage *)thumbnail andWithInfo:(NSString *)info andWithDirections:(NSString *)directions andWithMap:(UIImage *)map andWithGallery:(NSMutableArray *)gallery andWithGalleryCaptions:(NSArray *)galleryCaptions andWithYearFounded:(NSString *)yearFounded
{
    self = [super init];
    if (self)
    {
        [self setParkName:name];
        [self setParkLocation:location];
        [self setParkThumbnail:thumbnail];
        [self setParkInfo:info];
        [self setParkDirections:directions];
        [self setParkMap:map];
        [self setParkGallery:gallery];
        [self setParkGalleryCaptions:galleryCaptions];
        [self setYearFounded:yearFounded];
    }
    return self;
}
@end
