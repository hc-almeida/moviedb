//
//  RecommendedCustomCarousel.swift
//  Moviedb
//
//  Created by Hellen on 18/09/21.
//

import UIKit
import SnapKit

class RecommendedCustomCarousel: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout)

        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    // MARK: - Private Properties
    
    private var recommendationList: [Movie] = []
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Public Properties
    
    func setup(_ details: Details?) {
        guard let details = details else { return }
        
        recommendationList = details.recommendations
        collectionView.reloadData()
    }
    
    // MARK: - Private Properties
    
    private func getRecommendedMovieCell(indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = RecommendedCell.identifier
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
                as? RecommendedCell else { return UICollectionViewCell() }
        
        cell.setup(movie: recommendationList[indexPath.item])

        return cell
    }
}

// MARK: - ViewCodeProtocol Extension

extension RecommendedCustomCarousel: ViewCodeProtocol {
    
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
        backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        RecommendedCell.registerOn(collectionView)
    }
}

// MARK: - UICollectionView Protocol Extensions

extension RecommendedCustomCarousel: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendationList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return getRecommendedMovieCell(indexPath: indexPath)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout Extension

extension RecommendedCustomCarousel: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 140.0, height: 210.0)
    }
}
