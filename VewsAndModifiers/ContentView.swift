//
//  ContentView.swift
//  VewsAndModifiers
//
//  Created by Krow on 10/3/24.
//

import SwiftUI

struct ContentView: View {   
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercent = 20
    @State private var useRedText = false
    @FocusState private var amountIsFocused: Bool
    
    let TipPercentage = [10, 15, 20,25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double (tipPercent)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    var grandCheckTotal: Double {
        let tipValue = checkAmount / 100 *
        Double(tipPercent)
        return checkAmount + tipValue
        
    }
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    TextField("Amount", value:
                                $checkAmount, format:
                            .currency(code:
                                    Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of People", selection:
                            $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    // .pickerStyle(.navigationlink)
                }
                    Picker("How much do you want to tip?",
                selection: $tipPercent){
                        ForEach(0..<101){
                            Text(String($0))
                    }
                }
                .pickerStyle(.navigationLink)
                }
                
                Section {
                    Text(totalPerPerson, format:
                            .currency(code:
                                        Locale.current.currency?.identifier
                                      ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
                Section {
                    Text(grandCheckTotal, format: .currency(code:
                                                                Locale.current.currency?.identifier
                                                             ?? "USD"))
                    //project 3 chllg 1
                    .foregroundStyle(tipPercent == 0 ? .red : .primary)
                } header: {
                    Text("Check Total")
                }
                .navigationTitle("WeSplit")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                            
                    
                              
                                    
                                    
                                
                            }
                            
                            
                        }
                    }
                }
            }
        }

        #Preview {
            ContentView()
        }
        
        
        
    

#Preview {
    ContentView()
}
