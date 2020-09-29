//
//  LAJCard.m
//  DeckOfOneCard-C
//
//  Created by LAURA JELENICH on 9/29/20.
//

#import "LAJCard.h"

@implementation LAJCard

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self) {
        _suit = suit;
        _image = image;
    }
    return self;
}

@end

@implementation LAJCard (JSONConvertable)
- (LAJCard *)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    NSString *suit = topLevelDictionary[@"suit"];
    NSString *image = topLevelDictionary[@"image"];
    return [self initWithSuit:suit image:image];
}
@end
