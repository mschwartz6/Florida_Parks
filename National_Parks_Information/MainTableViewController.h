
#import <UIKit/UIKit.h>
#import "Park.h"
#import "ParkDirectory.h"
#import "ParkViewController.h"
#import "MainTableViewCell.h"
@interface MainTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)NSArray *appFonts;
@property (strong,nonatomic)NSArray *colorPalette;
@end
