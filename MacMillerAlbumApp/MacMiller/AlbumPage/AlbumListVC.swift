//
//  AlbumListVC.swift
//  MacMiller
//
//  Created by Atinati on 13.10.25.
//

import UIKit

class AlbumListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.albumCell) as! AlbumCell
        let album = albums[indexPath.row]
        cell.set(album: album)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedAlbum = albums[indexPath.row]
            let detailVC = AlbumDetailVC()
            detailVC.album = selectedAlbum
            navigationController?.pushViewController(detailVC, animated: true)
        }
    
    var albums: [Album] = []
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My favorite albums By Mac Miller"
        albums = fetchData()
        configureTableView()
        tableView.separatorColor = UIColor.darkGray

    }
    struct Cells {
        static let albumCell = "AlbumCell"
    }
    
    func configureTableView() {
        tableView.backgroundColor = UIColor(red: 0.97, green: 0.73, blue: 0.82, alpha: 1.0)
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 200
        tableView.register(AlbumCell.self, forCellReuseIdentifier: Cells.albumCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchData() -> [Album] {
        let album1 = Album(
            image: Image.album1,
            title: "Faces",
            description: "Faces is widely considered a masterpiece by Mac Miller, celebrated for its raw, introspective look into his struggles with addiction and mental health.",
            link: "https://open.spotify.com/album/5SKnXCvB4fcGSZu32o3LRY"
        )
        let album2 = Album(
            image: Image.album2,
            title: "Swimming",
            description: "Swimming reviews are mixed, with some praising Mac Miller's mature and introspective songwriting, its soulful and jazzy production, and its emotional depth, while others criticize the album's pacing and find his singing weaknesses detrimental to the music.",
            link: "https://open.spotify.com/album/5wtE5aLX5r7jOosmPhJhhk"
        )
        let album3 = Album(
            image: Image.album3,
            title: "Balloonerism",
            description: "Balloonerism is a posthumously released Mac Miller album praised for its emotional depth, experimental and jazzy production, and raw, intimate look into the artist's mind during a difficult period in his life. ",
            link: "https://open.spotify.com/album/2ANFIaCb53iam0MBkFFoxY"
        )
        let album4 = Album(
            image: Image.album4,
            title: "Circles",
            description: "Circles is an intimate and beautiful take into the mind of Mac Miller. Mac continues in following themes of depression, hope, and pushing through the struggles of life, all the while exploring his talents musically",
            link: "https://open.spotify.com/album/5sY6UIQ32GqwMLAfSNEaXb"
        )
        let album5 = Album(
            image: Image.album5,
            title: "K.I.D.S",
            description: "K.I.D.S., is a popular mixtape by Mac Miller praised for its nostalgic, upbeat, and carefree themes that capture the essence of growing up. Reviewers note its fun, light-hearted production, clever wordplay, and relatable lyrics about high school life, often finding it an easy and enjoyable listen.",
            link: "https://open.spotify.com/album/1jzqEyjugAp9iLtRsj9LZg"
        )
        let album6 = Album(
            image: Image.album6,
            title: "Watching Movies with the Sound Off",
            description: "Watching Movies with the Sound Off is largely reviewed as a significant artistic growth for Mac Miller, praised for its experimental and psychedelic production, improved lyricism and flows, and a shift to more personal and serious themes. ",
            link: "https://open.spotify.com/album/5lftuHeYvtCA64xGfUviwS",
        )
        let album7 = Album(
            image: Image.album7,
            title: "GO:OD AM",
            description: "GO:OD AM is generally considered a successful, mature, and well-balanced album that shows significant growth from Mac Miller, blending his previous styles while exploring themes of fame, struggle, and personal growth with a mix of upbeat tracks and more introspective moments.",
            link: "https://open.spotify.com/album/2Tyx5dLhHYkx6zeAdVaTzN"
        )
        let album8 = Album(
            image: Image.album8,
            title: "Dang",
            description: "Dang! is a modern-day masterpiece.",
            link: "https://open.spotify.com/album/271RC4MRPKwObqZszfuhFI"
        )
        let album9 = Album(
            image: Image.album9,
            title: "The Divine Feminine",
            description: "The Divine Feminine is pure warmth — an album that turns love into sound. Mac Miller lets go of ego and melts into something tender, spiritual, and timeless. Each song feels like sunlight through silk — soft, honest, and full of soul. It’s not just about romance, but about connection, vulnerability, and the beauty of being alive. Listening to it feels like falling in love with the world itself.",
            link: "https://open.spotify.com/album/6f6tko6NWoH00cyFOl4VYQ"
        )
        
        return [album1, album2, album3, album4, album5, album6, album7, album8, album9]
    }
}

