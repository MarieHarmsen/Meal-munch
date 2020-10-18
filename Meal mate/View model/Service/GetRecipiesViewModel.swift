import Foundation

class GetRecipiesViewModel: Any {
    weak var viewModelDelegate: HomeViewModelDelegate?

    init(with viewModelDelegate: HomeViewModelDelegate?) {
        self.viewModelDelegate = viewModelDelegate
    }


    func getData() {
        self.viewModelDelegate?.navigateToErrorScreen()

//        guard let spoonfulURL = URL(string: "https://api.spoonacular.com/food/products/search?query=yoghurt&apiKey=\(APIKeys().getSpoonfulAPIKey())") else { return }
//        var request = URLRequest(url: spoonfulURL)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let session = URLSession.shared
//        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//            print(response!)
//            do {
//                guard let data = data,
//                      let recipiesResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
//                print(recipiesResponse)
//            //    self.createMealsFromRecipiesResponse(recipies: recipiesResponse)
//            } catch {
//                viewModelDelegate?.navigateToErrorScreen()
//            }
//        })
//        task.resume()
    }

//    func createMealsFromRecipiesResponse(recipies: [Meals]) -> Meals {
//        return Meals(Meals[0].id )
//        return Meals(id: recipies.meals?[0].id,
//                     title: recipies.meals?[0].title,
//                     readyInMinutes: recipies.meals?[0].readyInMinutes,
//                     image: recipies.meals?[0].image)
//    }
}
