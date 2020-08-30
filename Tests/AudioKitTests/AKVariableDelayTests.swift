// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AudioKit

class AKVariableDelayTests: AKTestCase2 {

    override func setUp() {
        super.setUp()
        duration = 5.0 // needs to be this long since the default time is one second
    }

    func testDefault() {
        output = AKVariableDelay(input)
        AKTest()
    }

    func testFeedback() {
        output = AKVariableDelay(input, feedback: 0.95)
        AKTest()
    }

    func testMaximum() {
        output = AKVariableDelay(input, time: 0.02, feedback: 0.8, maximumTime: 0.02)
        AKTest()
    }

    func testMaximumSurpassed() {
        output = AKVariableDelay(input, time: 0.03, feedback: 0.8, maximumTime: 0.02)
        AKTest()
    }

    func testParametersSetAfterInit() {
        let effect = AKVariableDelay(input)
        effect.rampDuration = 0.0
        effect.time = 0.123_4
        effect.feedback = 0.95
        output = effect
        AKTest()
    }

    func testParametersSetOnInit() {
        output = AKVariableDelay(input, time: 0.123_4, feedback: 0.95)
        AKTest()
    }

    func testTime() {
        output = AKVariableDelay(input, time: 0.123_4)
        AKTest()
    }

}
