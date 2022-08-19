import Foundation
import CoreLocation

class MapViewModel: ObservableObject {
    let defaultZoomValue: Float = 15.0
    private static let zoomInterval: Float = 0.5
    private static let maxZoomValue: Float = 17.0
    @Published var zoomValue: Float = 0.0
    @Published var isVisibleZoomControl = false
    @Published var userLocation: CLLocationCoordinate2D? = nil
    var toZoomValue: Float {
        defaultZoomValue + zoomValue
    }

    func getButtonAction(buttonType: ZoommButtonType) -> (() -> Void) {
        switch buttonType {
        case .plus:
            return onPlusButtonTapped
        case .minus:
            return onMinusButtonTapped
        }
    }

    func getDisableValue(buttonType: ZoommButtonType) -> Bool {
        switch buttonType {
        case .plus:
            return zoomValue + defaultZoomValue == Self.maxZoomValue
        case .minus:
            return zoomValue == 0.0
        }
    }

    func getOpacity(buttontType: ZoommButtonType) -> Double {
        return getDisableValue(buttonType: buttontType) ? 0.5 : 1.0
    }

    private func onPlusButtonTapped() {
        zoomValue += Self.zoomInterval
    }

    private func onMinusButtonTapped() {
        zoomValue -= Self.zoomInterval
    }
}
