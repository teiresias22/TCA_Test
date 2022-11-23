//
//  TCA_TestApp.swift
//  TCA_Test
//
//  Created by markcloud on 2022/11/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_TestApp: App {
    
    let counterSotre = Store(initialState: CounterState(),
                             reducer: counterReducer,
                             environment: CounterEnviroment())
    
    var body: some Scene {
        WindowGroup {
            AppView(
                store: Store(
                    initialState: Todos.State(),
                    reducer: Todos()._printChanges()
                )
            )
        }
    }
}
