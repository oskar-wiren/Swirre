//
//  swirreTests.swift
//  swirreTests
//
//  Created by Oskar Wirén on 30/01/15.
//  Copyright (c) 2015 Citrix. All rights reserved.
//

import swirre
import Quick
import Nimble

class SWBindableSpec: QuickSpec {

    override func spec() {
        let value = "string"

        var bindable : SWBindable<String>?

        beforeEach {
            bindable = SWBindable(value)
        }

        afterEach {
            bindable = nil
        }

        it("init should initalize value") {
            expect(bindable!.value).to(equal(value))
        }

        it("bind should fire immediately") {
            var didFire = false

            bindable!.bind {
                (_) in didFire = true;
            }

            expect(didFire).to(beTrue())
        }

        context("when setting value") {
            it("bind should forward new value") {
                let newValue = "newStrings"
                var tmpValue: String?

                bindable!.bind {
                    tmpValue = $0
                }

                bindable?.value = newValue

                expect(tmpValue).to(equal(newValue))
            }
        }
    }

}