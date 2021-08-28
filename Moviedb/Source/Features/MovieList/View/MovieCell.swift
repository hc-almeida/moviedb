//
//  MovieCell.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import UIKit
import SnapKit

class MovieCell: UICollectionViewCell {
    
    // MARK: - User Interface Components
    
    private lazy var contentCard: UIView = {
        let view = UIView(frame: .zero)
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    private lazy var movieCard: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .darkGray
        return view
    }()
    
    private lazy var movieName: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var movieImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: MovieCell.self)
    
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
    
    func setup(movie: Movie) {
        movieName.text = movie.title
        
        if let poster = movie.posterPath {
            movieImage.load(url: MovieAPI.build(image: poster, size: .w500))
        }
    }
    
    // MARK: - Private Functions
    
    private func clearForReuse() {
        movieName.text = nil
        movieImage.image = nil
        movieImage.cancel()
    }
}

// MARK: - ViewCodeProtocol Extension

extension MovieCell: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(contentCard)
        contentCard.addSubview(movieCard)
        movieCard.addSubview(movieName)
        movieCard.addSubview(movieImage)
    }
    
    func setupConstraints() {
        contentCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.bottom.right.equalToSuperview()
        }
        
        movieCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
        
        movieImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        movieName.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(16)
            make.top.equalTo(movieImage.snp.bottom).offset(16)
        }
    }
    
    func setupComponents() {
        layer.cornerRadius = 10
        backgroundColor = .green
    }
}
