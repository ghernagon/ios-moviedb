//
//  DetailViewController.swift
//  movies
//
//  Created by Gerardo Hernández González on 29-04-20.
//  Copyright © 2020 Gerardo Hernández González. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resumeLabel: VerticalAlignLabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var selectedFilm: Film?
    private var filmsManager = FilmsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let film = selectedFilm {
            titleLabel.text = film.title
            resumeLabel.text = film.overview
            releaseDateLabel.text = film.releaseDate
            ratingLabel.text = "\(film.voteAverage)"
            
            if let coverUrl = film.backdrop {
                fetchCoverImageFrom(coverUrl) { (_) in }
            }
        }
    }
    
    func fetchCoverImageFrom(_ coverUrl: String, completionHandler: @escaping(_ status: Bool) -> Void) {
        filmsManager.fetchCoverImageFor(cover: coverUrl) { (image, error) in
            if (error != nil) {
                print(error)
                let fallbackImage: UIImage? = UIImage(named: "placeholder")
                self.coverImage.image = fallbackImage
                completionHandler(false)
            } else {
                self.coverImage.image = image
                completionHandler(true)
            }
        }
    }

}
