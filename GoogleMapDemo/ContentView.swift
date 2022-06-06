import SwiftUI

struct ContentView: View {
    @State private var zoomValue: Float = 0.0
    @State private var isZoomButtonDisable = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            MapView(zoomValue: $zoomValue).ignoresSafeArea()
            VStack {
                Button(action: { zoomValue += 0.5 }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(.blue)
                }
                .frame(width: 30, height: 30)
                .disabled(isZoomButtonDisable)
                .opacity(isZoomButtonDisable ? 0.5 : 1.0)

                Button(action: { zoomValue -= 0.5 }) {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .foregroundColor(.blue)
                }
                .frame(width: 30, height: 30)
                .disabled(zoomValue == 0.0)
                .opacity(zoomValue == 0.0 ? 0.5 : 1.0)
            }
            .padding(.trailing, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
