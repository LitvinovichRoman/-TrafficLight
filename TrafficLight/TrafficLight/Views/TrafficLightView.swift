//
//  ContentView.swift
//  TrafficLight
//
//  Created by Roman Litvinovich on 09/12/2023.
//

import SwiftUI

struct TrafficLightView: View {
    
    enum CurrentLight {
        case red
        case orange
        case green
    }
    
    @State private var timer: Timer? = nil
    @State private var colorState = CurrentLight.red
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                VStack {
                    Circle()
                        .foregroundColor(.red)
                        .opacity(colorState == .red || colorState == .orange ? 1 : 0.2)
                        .frame(height: 114)
                    
                    Circle()
                        .foregroundColor(.orange)
                        .opacity(colorState == .orange || colorState == .orange ? 1 : 0.2)
                        .frame(height: 114)
                    Circle()
                        .foregroundColor(.green)
                        .opacity(colorState == .green || colorState == .green ? 1 : 0.2)
                        .frame(height: 114)
                }
                .padding(70)
                
                HStack(alignment: .center) {
                    Button(action: {
                        setupColor()
                    }, label: {
                        Text("Start".uppercased())
                            .foregroundColor(.white)
                    })
                    .frame(width: 100, height: 45)
                    .background(.green)
                    .clipShape(.capsule)
                    
                    Button(action: {
                        self.timer?.invalidate()
                        self.timer = nil
                        self.colorState = CurrentLight.red
                    }, label: {
                        Text("Stop".uppercased())
                            .foregroundColor(.white)
                    })
                    .frame(width: 100, height: 45)
                    .background(.red)
                    .clipShape(.capsule)
                }
                .padding()
            }
            
        }
    }
    
    func setupColor() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            switch colorState {
            case .red:
                colorState = .orange
            case .orange:
                colorState = .green
            case .green:
                colorState = .red
            }
        }
    }
}

#Preview {
    TrafficLightView()
}
