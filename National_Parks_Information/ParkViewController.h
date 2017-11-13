
#import <UIKit/UIKit.h>
#import "Park.h"
#import "ParkInfoViewController.h"
#import "ParkGalleryViewController.h"
#import "ParkMapViewController.h"
#import "ParkDirectionsViewController.h"
@interface ParkViewController : UITableViewController
@property Park *thePark;
@property (strong,nonatomic)NSArray *appFonts;
@property (strong,nonatomic)NSArray *colorPalette;
@end
