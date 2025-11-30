//
//  Movie.swift
//  MovieMan
//
//  Created by Atinati on 18.10.25.
//
import UIKit

enum MovieType {
    case nowShowing
    case popular
    case both
}

struct Movie {
    
    let title: String
    let imdbRating: Double
    let duration: String
    let genres: [String]
    let posterName: String
    
    let director: String
    let language: String
    let rating: String
    let description: String
    let cast: [Actor]
    let type: MovieType
}

extension Movie {
    static var sampleData: [Movie] {
        [
            Movie(
                title: "Spiderman: No Way Home",
                imdbRating: 9.1,
                duration: "2h 28min",
                genres: ["FANTASY", "ACTION"],
                posterName: "SpidermanPoster",
                director: "Kristine Baghdavadze",
                language: "English",
                rating: "PG-13",
                description: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
                
                cast: [
                    Actor(name: "Tom Holland", photoName: "TomHolland"),
                    Actor(name: "Zendaya", photoName: "Zendaya"),
                    Actor(name: "Benedict Cumberbatch", photoName: "Benedict"),
                    Actor(name: "Jacob Batalon", photoName: "JacobBatalon")
                      ],
                type: .nowShowing
            ),
            
            Movie(
                title: "Eternals",
                imdbRating: 7.5,
                duration: "2h 37min",
                genres: ["ACTION", "SCI-FI", "DRAMA"],
                posterName: "EternalsPoster",
                director: "Chloé Zhao",
                language: "English",
                rating: "PG-13",
                description: ("The sprawling, thousands-year saga of the Eternals, a secret, powerful race of immortal cosmic beings who have silently lived among humanity on Earth for millennia and discreetly shaped the core history, events, and development of its many civilizations."),
                cast: [
                    Actor(name: "Gemma Chan", photoName: "GemmaChan"),
                    Actor(name: "Richard Madden", photoName: "RichardMadden"),
                    Actor(name: "Angelina Jolie", photoName: "AngelinaJolie"),
                    Actor(name: "Salma Hayek", photoName: "SalmaHayek")
                ],
                type: .nowShowing
            ),
            
            Movie(
                title: "Venom Let There Be Carnage",
                imdbRating: 6.4,
                duration: "1h 47m",
                genres: ["HORROR", "MYSTERY", "THRILLER"],
                posterName: "VenomPoster",
                director: "Andy Serkis",
                language: "English",
                rating: "PG-13",
                description: ("Eddie Brock and the sentient alien symbiote Venom are still grappling with the complexities of their precarious cohabitation and shared existence in a constantly evolving world when they are suddenly faced with an entirely new and devastating external threat."),
                cast: [
                    Actor(name: "Tom Hardy", photoName: "TomHardy"),
                    Actor(name: "Michelle Williams", photoName: "MichelleWilliams"),
                    Actor(name: "Naomie Harris", photoName: "NaomieHarris"),
                    Actor(name: "Stephen Graham", photoName: "StephenGraham")
                ],
                type: .popular
            ),
            
            Movie(
                title: "The King's Man",
                imdbRating: 8.4,
                duration: "1h 47m",
                genres: ["ACTION", "FANTASY"],
                posterName: "KingsmanPoster",
                director: "Matthew Vaughn",
                language: "English",
                rating: "R",
                description: ("In the early years of the 20th century, the Kingsman agency is formed to combat a dangerous cabal that is plotting a war to wipe out millions across the world."),
                cast: [
                    Actor(name: "Ralph Fiennes", photoName: "RalphFiennes"),
                    Actor(name: "Harris Dickinson", photoName: "HarrisDickinson"),
                    Actor(name: "Gemma Arterton", photoName: "GemmaArterton"),
                    Actor(name: "Rhys Ifans", photoName: "RhysIfans")
                ],
                type: .popular
            ),
            
            Movie(
                title: "Shang-Chi",
                imdbRating: 8.3,
                duration: "2h 12min",
                genres: ["ACTION", "ADVENTURE"],
                posterName: "ShangchiPoster",
                director: "Destin Daniel Cretton",
                language: "English",
                rating: "PG-13",
                description: "Shang-Chi, the master of unarmed weaponry and martial arts, who had sought a peaceful, hidden life, is suddenly forced to confront the dark and complicated past of his family and heritage after being inexorably drawn into the notorious Ten Rings criminal organization and its powerful leader.",
                cast: [
                    Actor(name: "Simu Liu", photoName: "SimuLiu"),
                    Actor(name: "Awkwafina", photoName: "Awkwafina"),
                    Actor(name: "Meng'er Zhang", photoName: "MengerZhang"),
                    Actor(name: "Tony Leung", photoName: "TonyLeung")
                ],
                type: .nowShowing
            ),
        ]
    }
}
