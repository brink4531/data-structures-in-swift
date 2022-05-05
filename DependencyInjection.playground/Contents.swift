import UIKit

// MARK: - Initializer Injection
class DataManager {
    private let serializer: String

    init(serializer: String) {
        self.serializer = serializer
    }

}

// Initialize Request Serializer
let serializer = String()

// Initialize Data Manager
let dataManager = DataManager(serializer: serializer)







// MARK: - Property Injection

class ViewController: UIViewController {
    var requestManager: String?
}

// Initialize View Controller
let viewController = ViewController()

// Configure View Controller
viewController.requestManager = String()









// MARK: - Method Injection

class DataManager2 {
    func serializeRequest(request: Int, with serializer: String) -> NSData? {
        return nil
    }
}
