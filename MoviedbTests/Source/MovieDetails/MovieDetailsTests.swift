//
//  MovieDetailsTests.swift
//  MoviedbTests
//
//  Created by Hellen on 05/10/21.
//

import XCTest
@testable import Moviedb

class MovieDetailsTests: XCTestCase {

    // MARK: - Public Properties
    
    var movieDetailsWorker: MovieDetailsWorkerProtocol!
    
    // MARK: - Test Lifecycle
    
    override func setUp() {
        self.movieDetailsWorker = MovieDetailsWorkerSuccessMock()
    }
    
    // MARK: - Unit Tests
    
    func testInteractorInitialization() {
        let interactor = MovieDetailsInteractor()
        XCTAssertNotNil(interactor)
    }
    
    func testFetchMovieDetails() {
        let movie = Movie(
            id: 1, title: "The movie",
            voteAverage: 2,
            releaseDate: "27/10/1995",
            overview: "Overview",
            posterPath: nil,
            backdropPath: nil)
        
        let viewController = build(movie: movie)
        
        viewController.interactor.fetchMovieDetails()
        
        XCTAssertTrue(viewController.showMovieDetailsCalled)
        XCTAssertTrue(viewController.showLoadingCalled)
        XCTAssertTrue(viewController.dismissLoadingCalled)
        XCTAssertNotNil(viewController.details)
        XCTAssertNotNil(viewController.movie)
    }
    
    func testFetchMovieDetailsFailure() {
        let movie = Movie(
            id: 1, title: "The movie",
            voteAverage: 2,
            releaseDate: "27/10/1995",
            overview: "Overview",
            posterPath: nil,
            backdropPath: nil)
        
        self.movieDetailsWorker = MovieDetailsWorkerFailureMock()
        let viewController = build(movie: movie)
        
        viewController.interactor.fetchMovieDetails()
        
        XCTAssertFalse(viewController.showMovieDetailsCalled)
        XCTAssertTrue(viewController.showMovieDetailsErrorCalled)
        XCTAssertTrue(viewController.showLoadingCalled)
        XCTAssertTrue(viewController.dismissLoadingCalled)
        XCTAssertNil(viewController.details)
        XCTAssertNil(viewController.movie)
    }
    
    // MARK: - Private Functions
    
    private func build(movie: Movie) -> MovieDetailsViewControllerMock {
        let viewController = MovieDetailsViewControllerMock()
        let presenter = MovieDetailsPresenter()
        let interactor = MovieDetailsInteractor(movieDetailsWorker: movieDetailsWorker)
        
        interactor.movie = movie
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
