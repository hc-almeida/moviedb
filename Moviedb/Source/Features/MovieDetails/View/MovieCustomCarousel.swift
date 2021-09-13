//
//  MovieCustomCarousel.swift
//  Moviedb
//
//  Created by Hellen on 13/09/21.
//

import UIKit
import SnapKit

class MovieCustomCarousel: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout)

        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    // MARK: - Private Properties
    
    private var movie: [Movie] = []
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Public properties
    
    enum MovieCustomCarouselSection: Int, CaseIterable {
        case cast = 0
//        case recommented = 1
    }
    
    func setup() {
 
        collectionView.reloadData()
    }
    
    func getCastMovieCell(indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = CastCell.identifier
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
                as? CastCell else { return UICollectionViewCell() }
        
//        cell.setup(movie: movie[indexPath.item])
  
        
        return cell
    }
    
}

// MARK: - ViewCodeProtocol Extension

extension MovieCustomCarousel: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        CastCell.registerOn(collectionView)
    }
}

// MARK: - UICollectionView Protocol Extensions

extension MovieCustomCarousel: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MovieCustomCarouselSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch MovieCustomCarouselSection(rawValue: section) {
        case .cast:
            return 5
//        case .recommented:
//            return 1
        case .none:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = MovieCustomCarouselSection(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch section {
        case .cast:
            return getCastMovieCell(indexPath: indexPath)
//        case .recommented:
//            return getCastMovieCell(indexPath: indexPath)
        }
    }
    
}

extension MovieCustomCarousel: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 140.0, height: 210.0)
    }
}
