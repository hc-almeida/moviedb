//
//  MovieCell.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import UIKit
import SnapKit

class MovieCell: UITableViewCell {
    
    private lazy var title: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    static let identifier = String(describing: MovieCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setup(movie: Movie) {
        title.text = movie.title
    }
}

extension MovieCell: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(title)
    }
    
    func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(16)
            make.bottom.right.equalToSuperview().inset(16)
        }
    }
    
    func setupComponents() {
        backgroundColor = .green
    }
}

