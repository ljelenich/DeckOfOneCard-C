//
//  LAJCard.h
//  DeckOfOneCard-C
//
//  Created by LAURA JELENICH on 9/29/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LAJCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *image;

- (instancetype)initWithSuit:(NSString *)suit
                       image:(NSString *)image;

@end

@interface LAJCard (JSONConvertable)
- (LAJCard *)initWithDictionary:(NSDictionary <NSString *, id>* )topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
