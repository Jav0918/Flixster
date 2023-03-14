//
//  movie.swift
//  Flixster
//
//  Created by Jonathan Velez on 3/6/23.
//

import Foundation

// TODO: Pt 1 - Create a Track model struct

struct Movie: Decodable {
    let original_title: String
    let overview: String
    let poster_path: URL
    let backdrop_path: URL
    let vote_average: Double
    let vote_count: Int
    let popularity: Float
    let id: Int
    
}

struct movieArray: Decodable {
    
    let results : [Movie]
}


// TODO: Pt 1 - Create an extension with a mock tracks static var

//extension Movie{
    
    /*
    static var mockMovies: [Movie] = [
        Movie (originalTitle: "Knock at the Cabin",
               overview: "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.",
               posterPath: URL(string:"https://image.tmdb.org/t/p/w500/dm06L9pxDOL9jNSK4Cb6y139rrG.jpg" )!,
               backDrop: URL(string: "https://image.tmdb.org/t/p/w500/22z44LPkMyf5nyyXvv8qQLsbom.jpg")!,
               voteAverage: "6.6",
               voteCount: "778",
               popularity: "4969.06"),
        
        Movie (originalTitle: "Black Panther: Wakanda Forever",
               overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death. As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
           posterPath: URL(string: "https://image.tmdb.org/t/p/w500/sv1xJUazXeYqALzczSZ3O6nkH75.jpg")!,
               backDrop: URL(string:"https://image.tmdb.org/t/p/w500/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg")!,
               voteAverage: "7.4",
               voteCount: "3823",
               popularity: "3501.2"),
        
        Movie (originalTitle: "Puss in Boots: The Last Wish",
               overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
               posterPath: URL(string:"https://image.tmdb.org/t/p/w500/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
               backDrop: URL(string:"https://image.tmdb.org/t/p/w500/b1Y8SUb12gPHCSSSNlbX4nB3IKy.jpg")!,
               voteAverage: "8.4",
               voteCount: "4277",
               popularity: "3278.515"),
        
        Movie (originalTitle: "Plane",
               overview: "After a heroic job of successfully landing his storm-damaged aircraft in a war zone, a fearless pilot finds himself between the agendas of multiple militias planning to take the plane and its passengers hostage.",
               posterPath: URL(string:"https://image.tmdb.org/t/p/w500/qi9r5xBgcc9KTxlOLjssEbDgO0J.jpg")!,
               backDrop: URL(string:"https://image.tmdb.org/t/p/w500/9Rq14Eyrf7Tu1xk0Pl7VcNbNh1n.jpg")!,
               voteAverage: "6.9",
               voteCount: "770",
               popularity: "2618.646"),
        
        Movie (originalTitle: "M3GAN",
               overview: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
               posterPath: URL(string: "https://image.tmdb.org/t/p/w500/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg")!,
               backDrop: URL(string: "https://image.tmdb.org/t/p/w500/dlrWhn0G3AtxYUx2D9P2bmzcsvF.jpg")!,
               voteAverage: "7.5",
               voteCount: "1891",
               popularity: "1731.62")
              
        
    ]
     */
//}


// MARK: Helper Methods
/// Converts milliseconds to mm:ss format
///  ex:  208643 -> "3:28"
///  ex:
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
