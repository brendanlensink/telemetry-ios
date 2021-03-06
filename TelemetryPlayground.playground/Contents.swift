//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import Telemetry

/**
 * Setup Telemetry configuration
 */
let configuration = Telemetry.default.configuration
configuration.appName = "Focus"
configuration.appVersion = "3.3"
configuration.updateChannel = "debug"
configuration.buildId = "1"
configuration.defaultSearchEngineProvider = "google"

configuration.measureUserDefaultsSetting(forKey: "foo", withDefaultValue: true)
configuration.measureUserDefaultsSetting(forKey: "bar", withDefaultValue: false)

Telemetry.default.add(pingBuilderType: CorePingBuilder.self)
Telemetry.default.add(pingBuilderType: FocusEventPingBuilder.self)

/**
 * Record usage
 */
for var i  in 1...10 {
    Telemetry.default.recordSessionStart()

    sleep(1)

    Telemetry.default.recordEvent(category: "action", method: "type_url", object: "search_bar")
    Telemetry.default.recordEvent(category: "action", method: "type_url", object: "search_bar")
    Telemetry.default.recordEvent(category: "action", method: "type_url", object: "search_bar")

    Telemetry.default.recordSearch(location: .actionBar, searchEngine: "bing")
    Telemetry.default.recordSearch(location: .listItem, searchEngine: "google")
    Telemetry.default.recordSearch(location: .listItem, searchEngine: "google")
    Telemetry.default.recordSearch(location: .suggestion, searchEngine: "yahoo")
    Telemetry.default.recordSearch(location: .suggestion, searchEngine: "yahoo")
    Telemetry.default.recordSearch(location: .suggestion, searchEngine: "yahoo")

    Telemetry.default.recordSessionEnd()

    /**
     * Add ping for the current session to the queue
     */
    Telemetry.default.queue(pingType: CorePingBuilder.PingType)
    Telemetry.default.queue(pingType: FocusEventPingBuilder.PingType)

    /**
     * Schedule queued pings for upload
     */
    Telemetry.default.scheduleUpload(pingType: CorePingBuilder.PingType)
    Telemetry.default.scheduleUpload(pingType: FocusEventPingBuilder.PingType)

    /**
     * Test code to retrieve queued pings from storage
     */
    //DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
    //    let storage = TelemetryStorage(name: "MozTelemetry", configuration: Telemetry.default.configuration)
    //    
    //    print("Core Pings\n================")
    //    while let ping = storage.dequeue(pingType: CorePingBuilder.PingType) {
    //        print(String(data: ping.measurementsJSON()!, encoding: .utf8)!)
    //    }
    //    
    //    print("FocusEvent Pings\n================")
    //    while let ping = storage.dequeue(pingType: FocusEventPingBuilder.PingType) {
    //        print(String(data: ping.measurementsJSON()!, encoding: .utf8)!)
    //    }
    //}
}
    
// Playground needs indefinite execution for async callbacks to function
PlaygroundPage.current.needsIndefiniteExecution = true
