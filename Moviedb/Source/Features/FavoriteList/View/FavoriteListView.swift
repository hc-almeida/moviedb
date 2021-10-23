//
//  FavoriteListView.swift
//  Moviedb
//
//  Created by Hellen on 22/10/21.
//

import Foundation
import SnapKit

class FavoriteListView: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - Private Properties
    
    private var movieList: [MovieObject] = []
    
    private unowned let delegate: FavoriteListViewDelegate
    
    // MARK: - Inits
    
    init(_ delegate: FavoriteListViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func setup(_ movieList: [MovieObject] ) {
        self.movieList.append(contentsOf: movieList)
        tableView.reloadData()
    }
    
    // MARK: - Private Functions
    
    private func selectMovie(at index: Int) {
//        delegate.selectCharacter(at: index)
    }
}

// MARK: - ViewCodeProtocol Extension

extension FavoriteListView: ViewCodeProtocol {

    func setupSubviews() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setupComponents() {
        backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        FavoriteCell.registerOn(tableView)
    }
}

// MARK: - UITableViewDelegate Extension

extension FavoriteListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = FavoriteCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: identifier, for: indexPath) as? FavoriteCell
        else { return UITableViewCell() }
        
//        cell.setup(name2: "Hellen Caroline", image2: UIImage(named: "joker1") ?? UIImage())
        cell.setup(movie: movieList[indexPath.item])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectMovie(at: indexPath.item)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == movieList.count {

        }
    }
}

// MARK: - UITableViewDataSource Extension

extension FavoriteListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
}
