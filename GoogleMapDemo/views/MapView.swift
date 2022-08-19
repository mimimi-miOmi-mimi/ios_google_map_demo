import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    final class Coordinator: NSObject, CLLocationManagerDelegate, GMSMapViewDelegate {
        var parent: MapView

        init(mapView: MapView) {
            parent = mapView
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let userLocation = locations.last else { return }
            let camera = GMSCameraPosition.camera(
                withLatitude: userLocation.coordinate.latitude,
                longitude: userLocation.coordinate.longitude,
                zoom: parent.viewModel.defaultZoomValue
            )
            parent.mapView.animate(to: camera)
            parent.locationManager.stopUpdatingLocation()
        }
    }

    let mapView = GMSMapView(frame: .zero)
    @ObservedObject var viewModel: MapViewModel
    @State var locationManager = CLLocationManager()

    func makeCoordinator() -> Coordinator {
        return Coordinator(mapView: self)
    }

    func makeUIView(context: Context) -> GMSMapView {
        mapView.isMyLocationEnabled = true
        mapView.delegate = context.coordinator
        locationManager.delegate = context.coordinator
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.animate(toZoom: viewModel.toZoomValue)
    }
}
