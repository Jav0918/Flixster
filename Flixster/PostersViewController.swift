//
//  PostersViewController.swift
//  Flixster
//
//  Created by Jonathan Velez on 3/13/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        
        let poster = posters[indexPath.item]
        
        let imageUrl = poster.poster_path
        
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w500" +  imageUrl.absoluteString)!, into: cell.posterImageView)
        
        return cell
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL (string: "https://api.themoviedb.org/3/movie/now_playing?api_key=f35e6eab08da2dd2b1f03224c0433797")!
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if let error = error {
                
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                
                print("❌ Data is nil")
                        return
            }
            
            let decoder = JSONDecoder()
            
            do {
                
                let response = try decoder.decode(postersSearchResponse.self, from: data)
                
                let posters = response.results
                
                //self?.posters = posters
                //self?.collectionView.reloadData()
                
                //print(posters)
                
                DispatchQueue.main.async{
                    
                    self?.posters = posters
                    
                    self?.collectionView.reloadData()
                }
                
               /* guard let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    
                    print("❌ Could not cast data to dictionary")
                                return
                    
                }
                
                print(jsonDictionary)
                */
            } catch {
                
                print(error.localizedDescription)
                //print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
        
        collectionView.dataSource = self
        
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumInteritemSpacing = 0
        
        layout.minimumLineSpacing = 6
        
        let numberOfColumns: CGFloat = 3
        
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        
        print("width is  \(collectionView.bounds.width)")
        
        layout.itemSize = CGSize(width: width, height: 200)
         

    }
    
    var posters: [Posters] = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    /*
    // MARK: - Navigation
     */
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? UICollectionViewCell,
        
        let indexPath = collectionView.indexPath(for: cell),
        
        let detailViewController = segue.destination as? PosterDetailViewController{
            
            let poster = posters[indexPath.row]
            
            detailViewController.poster = poster
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
