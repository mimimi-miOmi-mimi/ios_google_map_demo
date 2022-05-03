import Foundation
import GoogleMaps

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        guard let apiKey = Env["GOOGLE_MAP_API_KEY"] else { return true }
        GMSServices.provideAPIKey(apiKey)
        return true
    }
}
