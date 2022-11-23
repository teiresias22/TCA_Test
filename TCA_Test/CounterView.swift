//
//  ContentView.swift
//  TCA_Test
//
//  Created by markcloud on 2022/11/22.
//

import SwiftUI
import ComposableArchitecture

struct CounterState: Equatable {
    var count = 0
}

enum CounterAction: Equatable {
    case addCount
    case subtractCount
}

struct CounterEnviroment {
    
}

let counterReducer = AnyReducer<CounterState, CounterAction, CounterEnviroment> { state, action, enviroment in
    switch action {
    case .addCount:
        state.count += 1
        return Effect.none
    case .subtractCount:
        state.count -= 1
        return Effect.none
    }
}

struct CounterView: View {
    
    let store: Store<CounterState, CounterAction>
    
    var body: some View {
        WithViewStore(self.store) { ViewStore in
            VStack {
                Text("count: \(ViewStore.state.count)")
                    .padding()
                HStack {
                    Button("더하기") {
                        ViewStore.send(.addCount)
                    }
                    Button("빼기") {
                        ViewStore.send(.subtractCount)
                    }
                }
            }
        }
    }
}

//struct CounterView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CounterView(
//            store: Store(
//                initialState: CounterState(count: ViewStore.state.count),
//                reducer: counterReducer
//            )
//        )
//    }
//}
