import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    let mapView = GMSMapView(frame: .zero)
    func makeUIView(context: Context) -> some UIView {
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
