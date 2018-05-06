//
//  PlaceViewModel.swift
//  Laud
//
//  Created by Hoff Henry Pereira da Silva on 06/05/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

protocol PlaceViewModelDelegate: class {
    func placesLoaded()
}

class PlaceViewModel {
    
    weak var placeViewModelDelegate: PlaceViewModelDelegate!
    
    var arrayOfPlaces = [
        Place(name: "Outback Steakhouse", address: "St. de Habitações Individuais Norte CA 4 Lote A Loja 21 - Lago Norte, Brasília - DF, 71503-504", phone: "", images: [#imageLiteral(resourceName: "outback")], lat: -15.7205602, long: -47.8856354),
        Place(name: "Parque da Cidade Dona Sarah Kubitschek", address: "Srps - Brasília, DF, 70297-400", phone: "", images: [#imageLiteral(resourceName: "parque")], lat: -15.7924053, long: -47.9038259),
        Place(name: "Aeroporto Internacional de Brasília", address: "Lago Sul, Brasília - DF, 71608-900", phone: "", images: [#imageLiteral(resourceName: "aeroporto")], lat: -15.8697317, long: -47.9194235)
    ]
    
    
    func loadPlaces() {
        placeViewModelDelegate.placesLoaded()
    }
    
}
