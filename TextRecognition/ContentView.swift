//
//  ContentView.swift
//  TextRecognition
//
//  Created by Sarah Lichter on 9/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var recognizedText = "Tap button to start scanning."
    @State private var showingScanningView = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                        
                        Text(recognizedText)
                            .padding()
                    }.padding()
                }
                Spacer()
                
                HStack {
                    Spacer()
                    Button("Start Scanning") {
                        self.showingScanningView = true
                    }
                        .padding()
                        .foregroundColor(.white)
                        .background(Capsule().fill(Color.blue))
                }
                .padding()
            }
            .navigationBarTitle("Text Recognition")
            .sheet(isPresented: $showingScanningView) {
                ScanDocumentView(recognizedText: self.$recognizedText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
