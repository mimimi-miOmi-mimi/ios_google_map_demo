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
                zoom: 15.0
            )
            parent.mapView.animate(to: camera)
            parent.locationManager.stopUpdatingLocation()
        }

        func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        }
    }

    let mapView = GMSMapView(frame: .zero)
    @State var locationManager = CLLocationManager()
    @Binding var zoomValue: Float

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
        mapView.animate(toZoom: 15.0 + zoomValue)
    }
}
