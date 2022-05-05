import SwiftUI

struct ContentView: View {
    @State private var zoomValue: Float = 0.0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            MapView(zoomValue: $zoomValue).ignoresSafeArea()
            Stepper(value: $zoomValue, in: 0...2, step: 0.5, label: {})
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
