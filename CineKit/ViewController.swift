import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("TOKEN LOADED: \(APIConfig.readAccessToken.prefix(15))...")
        
        APIClient.shared.request(endpoint: .popular(page: 1)) { (result: Result<PopularMoviesResponse, Error>) in
            switch result {
            case .success(let response):
                print("✅ Got \(response.results.count) movies")
                print("First movie: \(response.results.first?.title ?? "N/A")")
            case .failure(let error):
                print("❌ Error: \(error)")
            }
        }
    }
}
