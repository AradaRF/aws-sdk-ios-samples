//
// Copyright 2018-2019 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSMobileClient
import AWSS3
import XCTest

class StoragePublicUploadUITests: XCTestCase {
    let albumName = UUID().uuidString
    let accessType = "Public"
    var app: XCUIApplication?

    override func setUp() {
        continueAfterFailure = false
        app = UIActions.launchApp()
        UtilitiesForStorageUITests.setupUpload(albumName: albumName, accessType: accessType)
    }

    override func tearDown() {
        UtilitiesForStorageUITests.teardownUpload(albumName: albumName)
    }

    func testS3UploadPublicBucket() {
        // Given valid sign-in, create album mutation succeeds
        // when the user uploads a picture
        // then download thumbnail and verify that upload was succesful

        // Actually tests consistency of Storage(upload,download) and API(create mutation) SDKs

        UtilitiesForStorageUITests.uploadAddPhoto()
        let addedPhotoCell = UIElements.PhotosScreen.addedPhotoCell
        XCTAssertTrue(addedPhotoCell.waitForExistence(timeout: networkTimeout))
    }
}

/* class UploadPrivateBucket: XCTestCase {

 let albumName = UUID().uuidString
 let accessType = "Private"
 let app = XCUIApplication()

 override func setUp() {
     continueAfterFailure = false
     app.launch()

     StorageUITests.setupUpload(albumName: albumName, accessType: accessType)
 }

 override func tearDown() {
     StorageUITests.teardownUpload(albumName: albumName)
 }

 func testS3UploadPrivateBucket() {

     StorageUITests.uploadAddPhoto()
     let addedPhotoCell = UIElements.addedPhotoCell()
     XCTAssertTrue(addedPhotoCell.waitForExistence(timeout: 5))
 }

 }

 class UploadProtectedBucket: XCTestCase {

 let albumName = UUID().uuidString
 let accessType = "Protected"
 let app = XCUIApplication()

 override func setUp() {
     continueAfterFailure = false
     app.launch()

     StorageUITests.setupUpload(albumName: albumName, accessType: accessType)
 }

 override func tearDown() {
     StorageUITests.teardownUpload(albumName: albumName)
 }

 func testS3UploadProtectedBucket() {

     StorageUITests.uploadAddPhoto()
     let addedPhotoCell = UIElements.addedPhotoCell()
     XCTAssertTrue(addedPhotoCell.waitForExistence(timeout: 5))
 }

 } */
