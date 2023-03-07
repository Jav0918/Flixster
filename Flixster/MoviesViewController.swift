//
//  ViewController.swift
//  Flixster
//
//  Created by Jonathan Velez on 3/6/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movie[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        movie = Movie.mockMovies
        print(movie)
    }
    
    var movie: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? UITableViewCell,
           
            let indexPath = tableView.indexPath(for: cell),
           
            let detailViewController = segue.destination as? DetailViewController{
            
            let movie = movie[indexPath.row]
            
            detailViewController.movie = movie
        }
        
        
    }
}
