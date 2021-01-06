import XCTest
@testable import MealMunch

class MealMunchTests: XCTestCase {
    private var viewModelDelegate: HomeViewModelDelegate?
    private var viewModel: HomeTableViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeTableViewModel(with: viewModelDelegate)
    }

    func testValidSearchData() {
        let searchData = "brownie"
        XCTAssertTrue(viewModel.isValidSearchData(query: searchData))
    }
    
    func testInValidSearchData() {
        let searchData = "brownie123"
        XCTAssertFalse(viewModel.isValidSearchData(query: searchData))
    }
}
