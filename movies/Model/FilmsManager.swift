//
//  FilmsManager.swift
//  movies
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

protocol FilmsManagerDelegate {
    func didFetchResults(films: Films)
    func didFailWithError(error: String?)
}

struct FilmsManager {
    
    private let apiURL = "https://api.themoviedb.org/3"
    private let coverURL = "https://image.tmdb.org/t/p/w500/"
    private let apiKey = "52ef6b3cc187304760cabeaf5c22660c"
    
    var delegate: FilmsManagerDelegate?
    
    public func fetchPopular() {
        let urlString = "\(apiURL)/movie/popular?api_key=\(apiKey)"
        
        AF.request(urlString)
            .validate()
            .responseDecodable(of: Films.self) { (response) in
                guard let films = response.value else {
                    self.delegate?.didFailWithError(error: response.error?.localizedDescription)
                    return
                }
                
                self.delegate?.didFetchResults(films: films)
        }
    }
    
    public func fetchCoverImageFor(cover: String, completion: @escaping(Image?, String?)->Void) {
        let urlString = "\(coverURL)\(cover)"
        
        AF.request(urlString)
            .validate()
            .responseImage { (response) in
                guard let image = response.value else {
                    completion(nil, response.error?.localizedDescription)
                    return
                }
                
                completion(image, nil)
        }
    }
    
}
