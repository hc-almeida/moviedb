//
//  MovieListTests.swift
//  MoviedbTests
//
//  Created by Hellen on 04/10/21.
//

import XCTest
@testable import Moviedb

class MovieListTests: XCTestCase {
    
    // MARK: - Public Properties
    
    var movieListWorker: MovieListWorkerProtocol!
    
    // MARK: - Test Lifecycle
    
    override func setUp() {
        self.movieListWorker = MovieListWorkerSuccessMock()
    }
    
    // MARK: - Unit Tests
    
    func testInteractorInitialization() {
        let interactor = MovieListInteractor()
        XCTAssertNotNil(interactor)
    }
    
    func testfecthMovieList() {
        let viewController = build()
        
        viewController.interactor.fecthMovieList()
        
        XCTAssertTrue(viewController.showMovieListCalled)
        XCTAssertEqual(viewController.movieList.first?.name, "Joker")
    }
    
    func testFetchNextPage() {
        let viewController = build()
        
        viewController.interactor.fecthMovieList()
        viewController.interactor.fetchNextPage()
        
        XCTAssertTrue(viewController.showMovieListCalled)
    }
    
    func testFetchNextPageFailed() {
        self.movieListWorker = MovieListWorkerFailedMock()
        let viewController = build()
        
        viewController.interactor.fecthMovieList()
        viewController.interactor.fetchNextPage()
        
        XCTAssertFalse(viewController.showMovieListCalled)
        XCTAssertTrue(viewController.showMovieListErrorCalled)
    }
    
    func testSelectMovie() {
        let viewController = build()
        
        viewController.interactor.fecthMovieList()
        viewController.interactor.select(at: 0)
        
        XCTAssertNotNil(viewController.interactor.movie)
        XCTAssertEqual(viewController.interactor.movie?.title, "Joker")
    }
    
    func testSearchMovieList() {
        let viewController = build()
        
        viewController.interactor.searchMovieList("Parasite")
        
        XCTAssertTrue(viewController.showMovieListCalled)
        XCTAssertEqual(viewController.movieList.last?.name, "Parasite")
    }
    
    func testSearchMovieListFailed() {
        self.movieListWorker = MovieListWorkerFailedMock()
        let viewController = build()
        
        viewController.interactor.searchMovieList("Joker")
        
        XCTAssertFalse(viewController.showMovieListCalled)
        XCTAssertTrue(viewController.showMovieListErrorCalled)
    }
    
    // MARK: - Private Functions
    
    private func build() -> MovieListViewControllerMock {
        let viewController = MovieListViewControllerMock()
        let presenter = MovieListPresenter()
        let interactor = MovieListInteractor(movieListWorker: movieListWorker)
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
