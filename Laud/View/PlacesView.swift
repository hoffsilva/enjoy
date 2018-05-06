//
//  PlacesView.swift
//  Laud
//
//  Created by Hoff Henry Pereira da Silva on 06/05/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit
import MapKit

class PlacesView: UIViewController {
    
    @IBOutlet var mapview: MKMapView!
    @IBOutlet var tableview: UITableView!
    
    var placeViewModel = PlaceViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        placeViewModel.placeViewModelDelegate = self
        // Do any additional setup after loading the view.
    }

}

extension PlacesView: MKMapViewDelegate {
    
}

extension PlacesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeViewModel.arrayOfPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell") as! PlaceViewCell
        
        return cell
    }
    
    
}

extension PlacesView: PlaceViewModelDelegate {
    func placesLoaded() {
        mapview.reloadInputViews()
        tableview.reloadData()
    }
    
    
}
