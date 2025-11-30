//
//  NowShowingCollectionManager.swift
//  MovieMan
//
//  Created by Atinati on 20.10.25.
//

import UIKit

class NowShowingCollectionManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: Properties
    
    weak var delegate: NowShowingContainerCellDelegate?
    private let viewModel: ContentViewModel
    
    // MARK: Initialization
    
    init(viewModel: ContentViewModel, delegate: NowShowingContainerCellDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init()
    }
    
    // MARK: UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.nowShowingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowShowingCollectionViewCell.reuseIdentifier, for: indexPath) as? NowShowingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let movie = viewModel.getNowShowingMovie(at: indexPath.row) {
            cell.configure(with: movie)
        }
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 280
        let width: CGFloat = 130
        return CGSize(width: width, height: height)
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.containerCell(didSelectItemAt: indexPath.row)
    }
}
