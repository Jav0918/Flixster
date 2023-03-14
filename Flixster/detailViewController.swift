//
//  DetailViewController.swift
//  Flixster
//
//  Created by Jonathan Velez on 3/7/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var votecountLabel: UILabel!
    
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w500/" + movie.backdrop_path.absoluteString)!, into: backdropImageView)
        
        
        
        titleLabel.text = movie.original_title
        votecountLabel.text = String(movie.vote_count)
        voteAverageLabel.text = String(movie.vote_average)
        popularityLabel.text = String(movie.popularity)
        overviewLabel.text = movie.overview
    }
    
    
   
        
        
        
        
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
    
    }
