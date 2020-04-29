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
                filmsManager.fetchCoverImageFor(cover: coverUrl) { (image, error) in
                    if (error != nil) {
                        print(error)
                        self.coverImage.image = #imageLiteral(resourceName: "placeholder")
                    } else {
                        self.coverImage.image = image
                    }
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
