import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let listContactViewModel = ListContactsViewModel()
            let listContactViewController = ListContactsViewController(viewModel: listContactViewModel)
            window.rootViewController = UINavigationController(rootViewController: listContactViewController)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

