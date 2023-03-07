//
//  MovieCell.swift
//  Flixster
//
//  Created by Jonathan Velez on 3/6/23.
//

import UIKit
import Nuke



class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie){
        movieNameLabel.text = movie.originalTitle
        movieOverviewLabel.text = movie.overview
        
        Nuke.loadImage(with: movie.posterPath, into: movieImageView)
    }

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
}
