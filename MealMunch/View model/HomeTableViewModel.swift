import Foundation

enum recipeKeys: String {
    case results = "results"
    case totalResults = "totalResults"
    case offset = "offset"
    case number = "number"
}

class HomeTableViewModel {
    weak var viewModelDelegate: HomeViewModelDelegate?
    var recipeViewData : RecipeViewData?

    init(with viewModelDelegate: HomeViewModelDelegate?) {
        self.viewModelDelegate = viewModelDelegate
    }

    func getData() {
        self.viewModelDelegate?.showLoadingScreen()
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=yoghurt&type&apiKey=\(APIKeys().getSpoonfulAPIKey())") else {
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
        if recipeViewData?.meals?.count ?? 0 >= Constants().MaxNumberOfRecipes {
            return Constants().MaxNumberOfRecipes
        }
        return recipeViewData?.meals?.count ?? 0
    }

    func getMealTitle(index: Int) -> String {
        return recipeViewData?.meals?[index].title ?? ""
    }

    func getMealImageURL(index: Int) -> URL? {
        return URL(string: recipeViewData?.meals?[index].image ?? "")
    }
}
