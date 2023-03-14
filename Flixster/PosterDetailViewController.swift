//
//  PosterDetailViewController.swift
//  Flixster
//
//  Created by Jonathan Velez on 3/13/23.
//

import UIKit
import Nuke

class PosterDetailViewController: UIViewController {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var votecountLabel: UILabel!
    
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    var poster: Posters!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w500/" + poster.backdrop_path.absoluteString)!, into: backdropImageView)
        
        titleLabel.text = poster.original_title
        votecountLabel.text = String(poster.vote_count)
        voteAverageLabel.text = String(poster.vote_average)
        popularityLabel.text = String(poster.popularity)
        overviewLabel.text = poster.overview
        
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
