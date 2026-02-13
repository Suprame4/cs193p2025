//
//  MatchMaker.swift
//  MasterMind
//
//  Created by Adrian GC on 2/9/26.
//
import SwiftUI

struct MatchMarkers: View {
    var matches: [Match]
    
    var body: some View {
        HStack {
            VStack {
                matchMarker(peg: 0)
                matchMarker(peg: 1)
            }
            VStack {
                matchMarker(peg: 2)
                matchMarker(peg: 3)
            }
            VStack {
                matchMarker(peg: 4)
                matchMarker(peg: 5)
            }
        }
    }
    
    func matchMarker(peg: Int) -> some View {
        let exactCount = matches.filter { $0 == .exact}.count
        let foundCount = matches.filter { $0 != .nomatch}.count
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
        
    }
    
}

enum Match {
    case exact
    case nomatch
    case inexact
}



#Preview {
    VStack {
        MasterMindView()
    }
}
#Preview {
    HStack(spacing: 10) {
        ForEach([10, 20, 40, 80, 160], id: \.self) { size in
            Circle()
                .frame(width: CGFloat(size), height: CGFloat(size))
        }
    }
}
