//
//  FilmsManager.swift
//  movies
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import Foundation
import Alamofire

struct FilmsManager {
    
    private let apiURL = "https://api.themoviedb.org/3"
    private let apiKey = "52ef6b3cc187304760cabeaf5c22660c"
    
    public func fetchPopular() {
        let urlString = "\(apiURL)/movie/popular?api_key=\(apiKey)"
        performRequest(with: urlString)
    }
    
    private func performRequest(with urlString: String) {
        let request = AF.request(urlString)
        
        request.responseJSON { (data) in
          print(data)
        }
    }

}
