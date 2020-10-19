import Foundation

enum recipeKeys: String {
    case results = "results"
    case totalResults = "totalResults"
    case offset = "offset"
    case number = "number"
}

class HomeTableViewModel: SearchViewDelegate {
    func didTapSearch(query: String) {
        self.query = query
        isValidSearchData(query: query) ? getData() : viewModelDelegate?.navigateToErrorScreen()
    }

    func isValidSearchData(query: String) -> Bool {
        for character in query {
            if !character.isLetter {
                return false
            }
        }
        return true
    }

    weak var viewModelDelegate: HomeViewModelDelegate?
    var searchViewDelegate: SearchViewDelegate?
    private var recipeViewData : RecipeViewData?
    private var query = "yoghurt"

    init(with viewModelDelegate: HomeViewModelDelegate?) {
        self.viewModelDelegate = viewModelDelegate
        self.searchViewDelegate = self
    }

    func getData() {
        self.viewModelDelegate?.showLoadingScreen()
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=\(query)&type&apiKey=\(APIKeys().getSpoonfulAPIKey())") else {
            showErrorScreen()
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if error != nil {
                self?.showErrorScreen()
                return
            }
            if let data = data {
                guard let recipe = try? JSONDecoder().decode(Recipe.self, from: data) else {
                    self?.showErrorScreen()
                    return
                }
                self?.recipeViewData = RecipeViewData(recipeResponse: recipe)
                DispatchQueue.main.async {
                    self?.viewModelDelegate?.dismissLoadingScreen()
                    self?.viewModelDelegate?.reloadTable()
                }
            }
        }.resume()
    }

    func showErrorScreen() {
        viewModelDelegate?.dismissLoadingScreen()
        do {
            sleep(1)
        }
        viewModelDelegate?.navigateToErrorScreen()
    }

    func getSectionCount() -> Int {
        guard let amountOfRecipies = recipeViewData?.meals?.count else { return 1 }
        if amountOfRecipies >= Constants().MaxNumberOfRecipes {
            return Constants().MaxNumberOfRecipes+1
        }
        return amountOfRecipies+1
    }

    func getMealTitle(index: Int) -> String {
        return recipeViewData?.meals?[index].title ?? ""
    }

    func getMealImageURL(index: Int) -> URL? {
        return URL(string: recipeViewData?.meals?[index].image ?? "")
    }
}
