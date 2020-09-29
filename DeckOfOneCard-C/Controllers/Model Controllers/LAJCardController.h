//
//  LAJCardController.h
//  DeckOfOneCard-C
//
//  Created by LAURA JELENICH on 9/29/20.
//

#import <UIKit/UIKit.h>
#import "LAJCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface LAJCardController : NSObject

+ (void)drawNewCard:(NSInteger)numberOfCards completion: (void (^) (NSArray<LAJCard *> *cards, NSError *error))completion;

+ (void)fetchCardImage:(LAJCard *)card completion: (void (^) (UIImage *))completion;


@end

NS_ASSUME_NONNULL_END
