//
//  LAJCardController.m
//  DeckOfOneCard-C
//
//  Created by LAURA JELENICH on 9/29/20.
//

#import "LAJCardController.h"

@implementation LAJCardController
//https://deckofcardsapi.com/api/deck/new/draw/?count=1
static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck";
static NSString * const drawCardEndpoint = @"new/draw";
static NSString * const countQueryName = @"count";

+ (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<LAJCard *> * _Nonnull, NSError * _Nonnull))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURL *drawCardURL = [baseURL URLByAppendingPathComponent:drawCardEndpoint];
    
    NSString *cardCount = [@(numberOfCards) stringValue];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawCardURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:countQueryName value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    
    NSURL *searchURL = urlComponents.URL;
    NSLog(@"%@", searchURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error)
                {
                    NSLog(@"Error fetching card: %@, %@", error, error.localizedDescription);
                    completion(nil, error.localizedDescription);
                    return;
                }
        
        if (!data)
        {
            NSLog(@"Error there appears to be no data: %@", error);
            completion(nil, error.localizedDescription);
            return;
        }
        NSDictionary *jsonDictionaries = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        
        NSArray *cardsArray = jsonDictionaries[@"cards"];
        
        NSMutableArray *cardsPlaceholder = [NSMutableArray array];
        
        for (NSDictionary *cardDictionaries in cardsArray)
        {
            LAJCard *card = [[LAJCard alloc] initWithDictionary:cardDictionaries];
            [cardsPlaceholder addObject:card];
        }
        completion(cardsPlaceholder, nil);
        
    }] resume];
}

+ (void)fetchCardImage:(LAJCard *)card completion:(void (^)(UIImage * _Nonnull))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.image];
    NSLog(@"%@", imageURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was data found for our image.");
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"There was data found for our image");
            completion(nil);
            return;
        }
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
        
    }] resume];
}

@end


