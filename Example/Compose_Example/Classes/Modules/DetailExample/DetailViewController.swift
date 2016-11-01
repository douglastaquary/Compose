//
//  DetailViewController.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailView: DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let toggleItem = UIBarButtonItem(title: "toggle", style: .plain, target: self, action: #selector(self.toggleDescription))
        self.navigationItem.rightBarButtonItem = toggleItem
        
        detailView.viewState = DetailViewState(photos: randomColors(maxColors: 20), rooms: 2, area: 320, parkingSpaces: 3, bathrooms: 1)
    }

    @IBAction func toggleDescription() {
        if detailView.viewState.description != nil {
            detailView.viewState.description = nil
        }
        else {
            detailView.viewState.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sit amet eros in ante mattis sollicitudin. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc ac accumsan magna. Pellentesque sit amet ex feugiat, placerat ex sed, faucibus diam. Nulla nec luctus nisl. Mauris risus urna, hendrerit eu enim non, finibus facilisis odio. Donec posuere ultricies purus, non ullamcorper tortor dignissim commodo. Aliquam porttitor enim justo, finibus vulputate dui fermentum sit amet. Integer eu consectetur sapien. Vestibulum suscipit eleifend aliquet. Suspendisse consectetur feugiat auctor. Proin accumsan diam feugiat risus pulvinar mattis a vitae augue. Cras vel est non velit egestas rutrum quis vel massa. \n\n Mauris facilisis pulvinar tincidunt. Etiam condimentum tortor vel neque congue, a tempus nisi mollis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras ac nunc risus. Cras sit amet sagittis leo. Aliquam urna ligula, dapibus at turpis nec, placerat rhoncus est. Nulla nec blandit nibh. Praesent fermentum nisi in leo semper, quis volutpat ligula finibus. Donec imperdiet fermentum iaculis. Nam non elit ultrices, varius lorem id, interdum risus. Ut egestas mi diam. Pellentesque nec faucibus diam. Pellentesque lacus nunc, suscipit in ullamcorper mollis, luctus laoreet ex. In euismod est quis tortor pretium, in elementum purus consequat."
        }
    }
    
}
