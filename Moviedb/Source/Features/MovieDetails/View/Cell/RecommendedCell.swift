//
//  RecommendedCell.swift
//  Moviedb
//
//  Created by Hellen on 18/09/21.
//

import UIKit
import MDCore

class RecommendedCell: UICollectionViewCell {
    
    // MARK: - User Interface Components
    
    private lazy var contentCard: UIView = {
        let view = UIView(frame: .zero)
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var recommendedImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: RecommendedCell.self)
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - View Lifecycle
    
    override func prepareForReuse() {
        clearForReuse()
    }
    
    // MARK: - Public Functions

    func setup(movie: Movie) {
        if let poster = movie.posterPath {
            recommendedImage.load(url: MovieAPI.build(image: poster, size: .w780))
        }
    }
    
    // MARK: - Private Functions
    
    private func clearForReuse() {
        recommendedImage.image = nil
        recommendedImage.cancel()
    }
}

// MARK: - ViewCodeProtocol Extension

extension RecommendedCell: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(contentCard)
        contentCard.addSubview(recommendedImage)
    }
    
    func setupConstraints() {
        contentCard.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview()
            make.left.top.equalToSuperview()
        }
        
        recommendedImage.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview()
            make.left.top.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(90)
        }
    }
}
