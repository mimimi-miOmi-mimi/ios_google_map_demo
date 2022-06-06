import SwiftUI

struct ContentView: View {
    private static let zoomInterval: Float = 0.5
    @State private var zoomValue: Float = 0.0
    @State private var isZoomButtonDisable = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            MapView(zoomValue: $zoomValue).ignoresSafeArea()
            makeZoomControl()
        }
    }

    private func makeZoomControl() -> some View {
        VStack {
            makeZoomButton(type: .plus, disable: isZoomButtonDisable)
            makeZoomButton(type: .minus, disable: zoomValue == 0.0)
        }
        .padding(.trailing, 10)
    }

    private func makeZoomButton(type: ZoommButtonType, disable: Bool) -> some View {
        Button(action: {
            switch type {
            case .plus:
                zoomValue += Self.zoomInterval
            case .minus:
                zoomValue -= Self.zoomInterval
            }
        }) {
            Image(systemName: type.imageName)
                .resizable()
                .foregroundColor(.blue)
        }
        .frame(width: 30, height: 30)
        .disabled(disable)
        .opacity(disable ? 0.5 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
