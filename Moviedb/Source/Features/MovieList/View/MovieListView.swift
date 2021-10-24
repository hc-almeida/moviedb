//
//  MovieListView.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import UIKit
import SnapKit

class MovieListView: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var emptyListView: EmptyMovieListView = {
        let view = EmptyMovieListView(frame: .zero)
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    // MARK: - Private Properties
    
    private var movieList: [MovieViewModel] = []
    
    private weak var delegate: MovieListViewDelegate?
    
    // MARK: - Inits
    
    init(_ delegate: MovieListViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func setup(_ movie: [MovieViewModel]) {
        movieList = movie
        collectionView.reloadData()
    }
    
    func set(_ movies: [MovieViewModel]) {
        var indexPaths: [IndexPath] = []
        
        for index in movies.indices {
            indexPaths.append(IndexPath(item: index + (movieList.count), section: 0))
        }
        
        movieList.append(contentsOf: movies)
        
        collectionView.performBatchUpdates({
            collectionView.insertItems(at: indexPaths)
        })
        
        setCollectionHidden(movieList.isEmpty)
    }
    
    func reloadMovies(_ movies: [MovieViewModel], animated: Bool) {
        movieList = movies
        
        if animated {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Private Functions
    
    private func fetchMovieListNextPage() {
        delegate?.fetchMovieListNextPage()
    }
    
    private func selectMovie(at index: Int) {
        delegate?.selectMovie(at: index)
    }
    
    private func setCollectionHidden(_ hidden: Bool) {
        emptyListView.isHidden = !hidden
        collectionView.isHidden = hidden
    }
}

// MARK: - UICollectionViewDelegate Extension

extension MovieListView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {

        let lastRowIndex = collectionView.numberOfItems(
            inSection: indexPath.section) - 1

        if lastRowIndex == indexPath.row {
            fetchMovieListNextPage()
        }

        cell.alpha = 0.0
        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        UIView.animate(withDuration: 0.4, delay: 0.0, options: .allowUserInteraction, animations: {
            cell.alpha = 1.0
            cell.transform = .identity
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectMovie(at: indexPath.item)
    }
}

// MARK: - UICollectionViewDataSource Extension

extension MovieListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = MovieCell.identifier
        
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: identifier, for: indexPath) as? MovieCell
        else { return UICollectionViewCell() }
        
        cell.setup(movieList[indexPath.item])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Extension

extension MovieListView: UICollectionViewDelegateFlowLayout {
    
    private var margin: CGFloat { 16.0 }
    
    private var insetForSections: UIEdgeInsets {
        UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding = insetForSections.left + insetForSections.right + margin
        let width = (bounds.size.width - padding) / 2
        let ratio: CGFloat = 1.5
        let height = width * ratio
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}

// MARK: - ViewCodeProtocol Extension

extension MovieListView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(collectionView)
        addSubview(emptyListView)
    }
    
    func setupConstraints() {
        emptyListView.snp.makeConstraints { make in
            make.left.right.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(safeAreaLayoutGuide).offset(48)
        }
        
        collectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setupComponents() {
        emptyListView.isHidden = true
        backgroundColor = .systemBackground
        MovieCell.registerOn(collectionView)
        collectionView.accessibilityIdentifier = "movieCollection"
    }
}
