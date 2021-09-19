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
//        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    private lazy var castImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var nameActor: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Hellen"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var characterActor: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Caroline"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    // MARK: - Public Properties
    
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
        contentCard.addSubview(castImage)
        contentCard.addSubview(nameActor)
        contentCard.addSubview(characterActor)
    }
    
    func setupConstraints() {
        contentCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
        
        castImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(90)
        }
        
        nameActor.snp.makeConstraints { make in
            make.top.equalTo(castImage.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        characterActor.snp.makeConstraints { make in
            make.top.equalTo(nameActor.snp.bottom).offset(2)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
    }
}
