//
//  CastCell.swift
//  Moviedb
//
//  Created by Hellen on 13/09/21.
//

import UIKit

class CastCell: UICollectionViewCell {
    
    // MARK: - User Interface Components
    
    private lazy var contentCard: UIView = {
        let view = UIView(frame: .zero)
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    private lazy var movieCard: UIView = {
        let view = UIView(frame: .zero)
//        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .darkGray
        return view
    }()
    
    private lazy var castImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - Public Properties
    
//    static var size = CGSize(width: 140.0, height: 210.0)
    
    static let identifier = String(describing: CastCell.self)
    
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
            castImage.load(url: poster)
        }
    }
    
    // MARK: - Private Functions
    
    private func clearForReuse() {
        castImage.image = nil
        castImage.cancel()
    }
}

// MARK: - ViewCodeProtocol Extension

extension CastCell: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(contentCard)
        contentCard.addSubview(movieCard)
        movieCard.addSubview(castImage)
    }
    
    func setupConstraints() {
        contentCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
        
        movieCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
        
        castImage.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
    }
}
