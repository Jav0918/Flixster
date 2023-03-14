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
        //tableView.dataSource = self
        
        //movie = Movie.mockMovies
        //print(movie)
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=f35e6eab08da2dd2b1f03224c0433797")!
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            do{
                
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(movieArray.self, from: data)
                
                let movie = response.results
                print("✅ \(movie)")
                
                DispatchQueue.main.async{
                    
                    self?.movie = movie
                    
                    self?.tableView.reloadData()
                }
                 
                //print("✅ \(movie)")
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
        print("👋 Below the closure")
        
        print(movie)
        
        tableView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
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
