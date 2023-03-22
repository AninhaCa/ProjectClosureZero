//
//  PriceViewController.swift
//  ProjectClosureZero
//
//  Created by Ana Paula Silva de Sousa on 22/03/23.
//

import UIKit
import SDWebImage

class PriceViewController: UIViewController {

    @IBOutlet var labelPriceG: UILabel!
    @IBOutlet var labelPriceM: UILabel!
    @IBOutlet var labelPriceP: UILabel!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var imagePrice: UIImageView!
    
    var pricePizza: PizzaElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlImage = URL(string: pricePizza?.imageURL ?? "")
        imagePrice.sd_setImage(with: urlImage)
        labelPriceP.text = "PEQUENA - R$ \(pricePizza?.priceP ?? 0)"
        labelPriceM.text = "MÉDIA - R$ \(pricePizza?.priceM ?? 0)"
        labelPriceG.text = "GRANDE - R$ \(pricePizza?.priceG ?? 0)"
        labelName.text = pricePizza?.name
    }
  
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func follow(_ sender: Any) {
        if let ratingView = self.storyboard?.instantiateViewController(identifier: "rating") as? RatingViewController {
            ratingView.ratingPizza = self.pricePizza
            self.present(ratingView, animated: true)
        }
    }
}
