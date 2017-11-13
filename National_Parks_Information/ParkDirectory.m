

#import "ParkDirectory.h"

@implementation ParkDirectory
-(id)initWithAllParks
{
    self = [super init];
    if (self)
    {
        self.allParks = [[NSMutableArray alloc]init];
        NSArray *parkNames = @[@"bigcypress",@"biscayne",@"canaveral",@"castillodesanmarcos",@"desoto",@"drytortugas",@"everglades",@"fortcaroline",@"fortmatanzas",@"gulfislands",@"gullahgeechee",@"timucuan"];
        NSArray *parkLocations =  @[@"Ochopee,FL",@"Florida",@"Brevard,FL", @"St. Augustine,FL", @"Bradenton,FL",@"Florida Keys",@"Florida",@"Jacksonville,FL",@"St. Augustine,FL",@"Gulf Coast",@"NC to FL",@"Jacksonville"];
        NSArray *years = @[@"1974",@"1968",@"1975",@"1924",@"1948",@"1935",@"1947",@"1953",@"1924",@"1971",@"2006",@"1988"];
        
        NSArray *prettyParkNames = @[@"Big Cypress", @"Biscayne", @"Canaveral", @"Castillo de San Marcos",@"De Soto", @"Dry Tortugas",@"Everglades",@"Fort Caroline",@"Fort Matanzas",@"Gulf Islands",@"Gullah/Geechee",@"Timucuan"];
        
        
        
        NSString *mainBundlePath = [[NSBundle mainBundle]bundlePath];
        
        
        NSMutableString *thumbnailPath = [NSMutableString stringWithFormat:@"%@%@",mainBundlePath,@"/App_Data/park-thumbnails/"];
        NSMutableString *parkInfoPath = [NSMutableString stringWithFormat:@"%@%@",mainBundlePath,@"/App_Data/parkwriteup/"];
        NSMutableString *parkGalleryPath = [NSMutableString stringWithFormat:@"%@%@",mainBundlePath,@"/App_Data/parkgalleries/"];
        NSMutableString *parkMapPath = [NSMutableString stringWithFormat:@"%@%@",mainBundlePath,@"/App_Data/parkmaps/"];
        NSMutableString *parkDirectionPath = [NSMutableString stringWithFormat:@"%@%@",mainBundlePath, @"/App_Data/Directions/"];
        NSMutableString *parkCaptionsPath = [NSMutableString stringWithFormat:@"%@%@",mainBundlePath,@"/App_Data/captions/"];
                                        
        
        
        \
        
        
        for (int i = 0; i < [parkNames count]; i++)
        {
            NSString *parkName = [parkNames objectAtIndex:i];
            NSString *parkLocation = [parkLocations objectAtIndex:i];
            NSString *parkYear = [years objectAtIndex:i];
            NSString *currentThumbnailPath  = [NSString stringWithFormat:@"%@%@%@",thumbnailPath,parkName,@".png"];
            NSString *currentParkInfoPath  = [NSString stringWithFormat:@"%@%@",parkInfoPath,parkName];
            
            NSString *currentParkMapPath  = [NSString stringWithFormat:@"%@%@%@",parkMapPath,parkName,@".png"];
            NSString *currentParkDirectionsPath = [NSString stringWithFormat:@"%@%@",parkDirectionPath,parkName];
            NSString *currentCaptionPath = [NSString stringWithFormat:@"%@%@%@",parkCaptionsPath,parkName,@".txt"];
            
            UIImage *currentMapImage = [UIImage imageWithContentsOfFile:currentParkMapPath];
            UIImage *currentThumbnailImage = [UIImage imageWithContentsOfFile:currentThumbnailPath];
            NSString *currentDirections = [NSString stringWithContentsOfFile:currentParkDirectionsPath encoding:NSUTF8StringEncoding error:nil];
            NSString *currentParkInfo = [NSString stringWithContentsOfFile:currentParkInfoPath encoding:NSUTF8StringEncoding error:nil];
            NSString *currentCaptions = [NSString stringWithContentsOfFile:currentCaptionPath encoding:NSUTF8StringEncoding error:nil];
            //break up caption text files into array to match them with the given gallery image
            NSArray *currentCaptionsArray = [currentCaptions componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
            
            NSString *currentParkGalleryDirectoryPath = [NSString stringWithFormat:@"%@%@/",parkGalleryPath,parkName];
            //get array of folder contents to know how many items are in the folder
            NSArray *currentParkGalleryPathArray = [[NSFileManager defaultManager]contentsOfDirectoryAtPath:currentParkGalleryDirectoryPath error:nil];
            NSMutableArray *arrayOfGalleryImages = [[NSMutableArray alloc]init];
           
            
            //populate an array of images for each park
            for (int i = 0 ; i < [currentParkGalleryPathArray count];i++)
            {
                NSString *currentGalleryImagePath = [NSString stringWithFormat:@"%@%d%@",currentParkGalleryDirectoryPath,(i+1),@".png"];
                UIImage *currentImage = [UIImage imageWithContentsOfFile:currentGalleryImagePath];
                [arrayOfGalleryImages addObject:currentImage];
                
            }
            
            
            
            Park *currentPark = [[Park alloc]initWithName:[prettyParkNames objectAtIndex:i] andWithLocation:parkLocation andWithThumbnail:currentThumbnailImage andWithInfo:currentParkInfo andWithDirections:currentDirections andWithMap:currentMapImage andWithGallery:arrayOfGalleryImages andWithGalleryCaptions:currentCaptionsArray andWithYearFounded:parkYear];
            [self.allParks addObject:currentPark];
            
            
        }
    }
    return self;
}
@end
