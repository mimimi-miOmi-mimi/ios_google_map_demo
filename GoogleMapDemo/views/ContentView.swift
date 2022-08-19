import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MapViewModel()

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            MapView(viewModel: viewModel).ignoresSafeArea()
            makeZoomControl()
        }
    }

    private func makeZoomControl() -> some View {
        VStack {
            makeZoomButton(type: .plus)
            makeZoomButton(type: .minus)
        }
        .padding(.trailing, 10)
    }

    private func makeZoomButton(type: ZoommButtonType) -> some View {
        Button(action: viewModel.getButtonAction(buttonType: type)) {
            Image(systemName: type.imageName)
                .resizable()
                .foregroundColor(.blue)
        }
        .frame(width: 30, height: 30)
        .disabled(viewModel.getDisableValue(buttonType: type))
        .opacity(viewModel.getOpacity(buttontType: type))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
