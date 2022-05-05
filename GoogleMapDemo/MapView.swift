import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    final class Coordinator: NSObject, CLLocationManagerDelegate {
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
    }

    let mapView = GMSMapView(frame: .zero)
    @State var locationManager = CLLocationManager()

    func makeCoordinator() ->Coordinator {
        return Coordinator(mapView: self)
    }

    func makeUIView(context: Context) -> some UIView {
        mapView.isMyLocationEnabled = true
        locationManager.delegate = context.coordinator
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        return mapView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
