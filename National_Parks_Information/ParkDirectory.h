

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Park.h"
@interface ParkDirectory : NSObject
@property (nonatomic,strong) NSMutableArray *allParks;
-(id)initWithAllParks;
@end
