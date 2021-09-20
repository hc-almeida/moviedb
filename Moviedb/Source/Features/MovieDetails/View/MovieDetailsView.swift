//
//  MovieDetailsView.swift
//  Moviedb
//
//  Created by Hellen on 07/09/21.
//

import UIKit
import SnapKit

class MovieDetailsView: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var backdropImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        return UIScrollView(frame: .zero)
    }()
    
    private lazy var scrollContent: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    private lazy var detailsContent: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private lazy var moviePoster: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameMovie: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var durantionMovie: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var genreMovie: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var tmdbLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "TMDB"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var noteMovie: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var synopsisMovie: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Sinopse"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var descriptionMovie: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var castTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Elenco"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var castCarousel: CastCustomCarousel = {
        return CastCustomCarousel(frame: .zero)
    }()

    private lazy var recommendationsTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Recomendações"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var recommendationsCarousel: RecommendedCustomCarousel = {
        return RecommendedCustomCarousel(frame: .zero)
    }()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func setup(_ movie: Movie, details: Details) {
        if let posterPath = movie.posterPath {
            moviePoster.load(url: MovieAPI.build(image: posterPath, size: .w500))
        }
        
        if let backdropPath = movie.backdropPath {
            backdropImage.load(url: MovieAPI.build(image: backdropPath, size: .w780))
        }
        
        let note = String(movie.voteAverage)
        
        nameMovie.text = movie.title
        durantionMovie.text = details.duration
        genreMovie.text = details.genres
        noteMovie.text = "\(note) /10"
        descriptionMovie.text = movie.overview
//        castCarousel.setup(details)
        recommendationsCarousel.setup(details)
    }
}

// MARK: - ViewCodeProtocol Extension

extension MovieDetailsView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(scrollContent)
        scrollContent.addSubview(backdropImage)
        scrollContent.addSubview(detailsContent)
        detailsContent.addSubview(moviePoster)
        detailsContent.addSubview(nameMovie)
        detailsContent.addSubview(durantionMovie)
        detailsContent.addSubview(genreMovie)
        detailsContent.addSubview(tmdbLabel)
        detailsContent.addSubview(noteMovie)
        detailsContent.addSubview(synopsisMovie)
        detailsContent.addSubview(descriptionMovie)
        detailsContent.addSubview(castTitle)
        detailsContent.addSubview(castCarousel)
        detailsContent.addSubview(recommendationsTitle)
        detailsContent.addSubview(recommendationsCarousel)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.left.right.equalTo(safeAreaLayoutGuide)
            make.top.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        scrollContent.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        backdropImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(detailsContent.snp.top).offset(20)
        }
        
        detailsContent.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.left.right.bottom.equalToSuperview()
        }
        
        moviePoster.snp.makeConstraints { make in
            make.height.equalTo(230)
            make.width.equalTo(160)
            make.left.equalTo(detailsContent).offset(16)
            make.top.equalTo(detailsContent.snp.top).offset(-30)
        }
        
        nameMovie.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(45)
            make.left.equalTo(moviePoster.snp.right).offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        durantionMovie.snp.makeConstraints { make in
            make.top.equalTo(nameMovie.snp.bottom).offset(16)
            make.left.equalTo(moviePoster.snp.right).offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        genreMovie.snp.makeConstraints { make in
            make.top.equalTo(durantionMovie.snp.bottom).offset(8)
            make.left.equalTo(moviePoster.snp.right).offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        tmdbLabel.snp.makeConstraints { make in
            make.top.equalTo(genreMovie.snp.bottom).offset(8)
            make.left.equalTo(moviePoster.snp.right).offset(16)
        }
        
        noteMovie.snp.makeConstraints { make in
            make.top.equalTo(genreMovie.snp.bottom).offset(8)
            make.left.equalTo(tmdbLabel.snp.right).offset(8)
        }
        
        synopsisMovie.snp.makeConstraints { make in
            make.top.equalTo(moviePoster.snp.bottom).offset(16)
            make.left.equalTo(detailsContent).offset(16)
        }
        
        descriptionMovie.snp.makeConstraints { make in
            make.top.equalTo(synopsisMovie.snp.bottom).offset(8)
            make.left.equalTo(detailsContent).offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        castTitle.snp.makeConstraints { make in
            make.top.equalTo(descriptionMovie.snp.bottom).offset(16)
            make.left.equalTo(detailsContent).offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        castCarousel.snp.makeConstraints { make in
            make.top.equalTo(castTitle.snp.bottom).offset(2)
            make.left.right.equalToSuperview()
        }

        recommendationsTitle.snp.makeConstraints { make in
            make.top.equalTo(castCarousel.snp.bottom).offset(8)
            make.left.equalTo(detailsContent).offset(16)
            make.right.equalToSuperview().inset(16)
        }

        recommendationsCarousel.snp.makeConstraints { make in
            make.top.equalTo(recommendationsTitle.snp.bottom).offset(2)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func setupComponents() {
        backgroundColor = .systemBackground
    }
}
