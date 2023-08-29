import SwiftUI

struct ListOfTheAlarmsView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager

    @State var isActive = false
    @State var currentIndex: Int? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(lnManager.alarmViewModels.indices, id: \.self) { i in

                        Button(action: {
                            currentIndex = i
                            isActive.toggle()
                        }, label: {
                            AlarmRowView(model: lnManager.alarmViewModels[i], i: i)
                                .padding(.vertical)
                        })

//                        NavigationLink(destination: {
//                            MainAddEditAlarmView(currentAlarmIndex: i, alarmModel: lnManager.alarmViewModels[i])
//                                .tabItem { Label("Alarms", systemImage: "alarm.fill") }
//                        }, label: {
//                            AlarmRowView(model: lnManager.alarmViewModels[i], i: i)
//
//                        })
                    }
                    .onDelete(perform: deleteMe)
                }

            }.navigationTitle("Alarm list")
                .sheet(
                    isPresented: $isActive,
                    onDismiss: {})
            {
                // Edit the currentIndex alarm

                AddEditAlarmView(currentAlarmIndex: currentIndex)
//                        ChooseAlarmView(currentAlarmIndex: $currentIndex, addEditViewType: addEditViewType)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        MainAddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())

                    }, label: {
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(black)

                    })
//                        Button(action: {
//                            isActive.toggle()
//                        }, label: {
//                            Text("+")
//                                .font(.largeTitle)
//                                .fontWeight(.semibold)
//                                .foregroundColor(black)
//                        })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }

    func deleteMe(offsets: IndexSet) {
        // Remove from pending alarms
        for index in offsets {
            // TODO: remove request for given id
            lnManager.removeRequest(id: lnManager.alarmViewModels[index].id)
        }

        // Removing from alarmViewModels
        lnManager.alarmViewModels.remove(atOffsets: offsets)
    }
}

struct ListOfTheAlarmsView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfTheAlarmsView()
            .environmentObject(LocalNotificationManager())
    }
}
