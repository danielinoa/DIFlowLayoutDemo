//
//  Created by Daniel Inoa on 9/27/22.
//

import DIFlowLayout
import SwiftUI

struct DemoView: View {

    private let words = [
        "consectetur",
        "adipisicing",
        "elit",
        "sed",
        "do",
        "eiusmod",
        "tempor",
        "incididunt",
        "ut",
        "labore",
        "et",
        "dolore",
        "magna",
        "aliqua",
        "Ut",
        "enim",
        "ad",
        "minim",
        "veniam",
    ]

    private let spacingRange: ClosedRange<Double> = 0...25

    @State private var direction: DIFlowLayout.Direction = .forward
    @State private var horizontalAlignment: DIFlowLayout.HorizontalAlignment = .leading
    @State private var verticalAlignment: DIFlowLayout.VerticalAlignment = .top
    @State private var horizontalSpacing: Double = .zero
    @State private var verticalSpacing: Double = .zero

    var body: some View {
        VStack {
            DIFlowLayout(
                direction: direction,
                horizontalAlignment: horizontalAlignment,
                verticalAlignment: verticalAlignment,
                horizontalSpacing: horizontalSpacing,
                verticalSpacing: verticalSpacing
            ) {
                Group {
                    Text("Test").bold()
                    Text("Test 2").padding(10)
                    Color.green.frame(width: 160, height: 20)
                    ForEach(words) {
                        Text($0)
                    }
                    Color.red.frame(width: 80, height: 80)
                    Text("Test 3")
                    Text("Test 4")
                }
                .padding(10)
                .border(.teal, width: 2)
            }
            .border(.purple)
            .padding(10)
            Spacer()
            controls
                .padding(20)
                .background(Color.gray.opacity(0.15))
        }
        .border(.blue)
    }

    private var controls: some View {
        VStack {
            HStack {
                Text("Direction")
                Spacer()
                Picker("", selection: $direction.animation()) {
                    Text("Forward").tag(DIFlowLayout.Direction.forward)
                    Text("Reverse").tag(DIFlowLayout.Direction.reverse)
                }
                .pickerStyle(.segmented)
            }
            HStack {
                Text("H. Alignment")
                Spacer()
                Picker("", selection: $horizontalAlignment.animation()) {
                    Text("Leading").tag(DIFlowLayout.HorizontalAlignment.leading)
                    Text("Center").tag(DIFlowLayout.HorizontalAlignment.center)
                    Text("Trailing").tag(DIFlowLayout.HorizontalAlignment.trailing)
                }
                .pickerStyle(.segmented)
            }
            HStack {
                Text("V. Alignment")
                Spacer()
                Picker("", selection: $verticalAlignment.animation()) {
                    Text("Top").tag(DIFlowLayout.VerticalAlignment.top)
                    Text("Center").tag(DIFlowLayout.VerticalAlignment.center)
                    Text("Bottom").tag(DIFlowLayout.VerticalAlignment.bottom)
                }
                .pickerStyle(.segmented)
            }
            VStack(alignment: .leading, spacing: 0) {
                Text("Horizontal Spacing")
                HStack {
                    Text("\(Int(horizontalSpacing))")
                        .frame(width: 60)
                        .border(.black)
                        .transaction { $0.animation = nil }
                    Slider(value: $horizontalSpacing.animation(), in: spacingRange)
                }
            }

            VStack(alignment: .leading, spacing: 0) {
                Text("Vertical Spacing")
                HStack {
                    Text("\(Int(verticalSpacing))")
                        .frame(width: 60)
                        .border(.black)
                        .transaction { $0.animation = nil }
                    Slider(value: $verticalSpacing.animation(), in: spacingRange)
                }
            }
        }
    }
}

extension String: Identifiable {
    public var id: String {
        self
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
