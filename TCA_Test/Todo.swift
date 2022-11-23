//
//  Todo.swift
//  TCA_Test
//
//  Created by markcloud on 2022/11/22.
//

import SwiftUI
import ComposableArchitecture

struct Todo: ReducerProtocol {
    struct State: Equatable, Identifiable {
        var description = ""
        let id: UUID
        var isComplete = false
    }
    
    enum Action: Equatable {
        case checkBoxToggled
        case TextFieldChange(String)
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .checkBoxToggled:
            state.isComplete.toggle()
            return .none
            
        case let .TextFieldChange(description):
            state.description = description
            return .none
        }
    }
}

struct TodoView: View {
    let store: StoreOf<Todo>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { ViewStore in
            HStack {
                Button(action: { ViewStore.send(.checkBoxToggled )}) {
                    Image(systemName: ViewStore.isComplete ? "checkmark.square" : "square")
                }
                .buttonStyle(.plain)
                
                TextField("Untitled Todo",
                          text: ViewStore.binding(get: \.description, send: Todo.Action.TextFieldChange)
                )
            }
            .foregroundColor(ViewStore.isComplete ? .gray : nil)
        }
    }
}

//struct TodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoView()
//        )
//    }
//}
