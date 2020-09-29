//
//  LAJCardViewController.swift
//  DeckOfOneCard-C
//
//  Created by LAURA JELENICH on 9/29/20.
//

import UIKit

class LAJCardViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    //MARK: - Properties
    var cards: [LAJCard] = []
    var image: UIImage?
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        drawCard()
    }
    
    //MARK: - Actions
    @IBAction func newCardButtonPressed(_ sender: Any) {
        drawCard()
    }

    //MARK: - Helper Functions
    func drawCard() {
        LAJCardController.drawNewCard(1) { (card, error) in
            LAJCardController.fetchCardImage(card[0]) { (image) in
                DispatchQueue.main.async {
                    self.cards = card
                    for card in self.cards {
                        self.suitLabel.text = card.suit
                    }
                    self.cardImageView.image = image
                }
            }
        }
    }
}
