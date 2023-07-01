//
//  WorkoutTimerView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

public struct WorkoutTimerView: View {    
    public let store: StoreOf<WorkoutTimerStore>
    
    @EnvironmentObject private var watchConnectivityDelegate: WatchConnectivityDelegate
    
    public init(store: StoreOf<WorkoutTimerStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            IfLetStore(
                store.scope(state: \.counter, action: { .counter($0) }),
                then: {
                    WorkoutCounterView(store: $0)
                },
                else: {
                    VStack {
                        titleView(viewStore: viewStore)
                        
                        resultView(viewStore: viewStore)
                            .padding(.top, 64)
                        
                        PumpingSubmitButton(title: "종료", completion: {
                            viewStore.send(.endButtonTapped)
                        })
                        .padding()
                    }
                    .onReceive(watchConnectivityDelegate.$heartRate, perform: { heartRate in
                        viewStore.send(.updateHeartRate(heartRate))
                    })
                    .onReceive(watchConnectivityDelegate.$calorie, perform: { calorie in
                        viewStore.send(.updateCalorie(calorie))
                    })
                    .background(Color.colorGrey000)
                    .navigationBarBackButtonHidden(true)
                }
            )
        }
    }
    
    private func titleView(viewStore: ViewStoreOf<WorkoutTimerStore>) -> some View {
        VStack {
            HStack {
                Text("운동 목록")
                    .font(.pretendard(size: 24, type: .bold))
                    .foregroundColor(.colorGrey900)
                
                Spacer()
            }
            .padding(.top, 16)
            .padding(.bottom, 22)
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEachStore(self.store.scope(state: \.timerCells, action: WorkoutTimerStore.Action.timerCell(id:action:))) {
                        WorkoutTimerCellView(store: $0)
                    }
                }
                .padding(.bottom, 24)
            }
            .padding(.leading)
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .background(Color.colorGrey100)
    }
    
    private func resultView(viewStore: ViewStoreOf<WorkoutTimerStore>) -> some View {
        VStack {
            resultTextView(type: .time, value: Double(viewStore.state.time))
            resultTextView(type: .heatRate, value: viewStore.state.heartRateToShow)
            resultTextView(type: .calorie, value: viewStore.state.calorieToShow)
        }
    }
    
    private func resultTextView(type: WorkoutTimerStore.ResultType, value: Double) -> some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                type.image
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text(type.title)
                    .font(.pretendard(size: 16, type: .bold))
                    .foregroundColor(PumpingColors.colorGrey800.swiftUIColor)
            }
            
            Text(type.toSyntax(value: value))
                .font(.tenada(size: 56))
                .baselineOffset(-10)
                .foregroundColor({switch type {
                case .time:
                    return PumpingColors.colorCyan200.swiftUIColor
                case .heatRate:
                    return PumpingColors.colorTeal300.swiftUIColor
                case .calorie:
                    return PumpingColors.colorGreen400.swiftUIColor
                }}())
        }
    }
}
