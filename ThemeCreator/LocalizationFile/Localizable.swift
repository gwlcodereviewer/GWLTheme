//
//  Localizable.swift
//  BizTalk
//
//  Created by Sumit Jagdev on 29/10/19.
//  Copyright © 2019 GalaxyWeblinks. All rights reserved.
//

import Foundation
let year = Calendar.current.component(.year, from: Date())

enum Localizable {
    enum Call: String, LocalizableProtocol {
        case MaxUsers
        case yes
        case no
        case callOnHold
        case resumeHoldMsg
        case EndCall
        case callOnHoldMsg
        case Biztalk
        case userbusyTitle
        case userbusyMessage
    }
    enum Permissions: String, LocalizableProtocol {
        case cameraAccessTitle
        case cameraAccessMessage
        case micAccessTitle
        case micAccessMessage
    }
    enum Global: String, LocalizableProtocol {
        case cancel, close, next, save, done, failed, success, okTitle, remove, logOutCallTitle, add, alert
        case Resend
        case login
        case passwordValidationLength
        case requiredPasswordValidation
        case signUp
        case password
        case emailLabel
        case organization
        case copyright
        case error
        case emailValidation
        case organizationValidation
        case viewProfile
        case groupInfo
        case you
        case passwordValidation
        case selectImage, captureImage, deleteImage, takeImage
        case firstNameValidation
        case lastNameValidation
        case internetNotAvailable
        case somethingWentWrong
        case internetServerError
    }

    enum Validator: String, LocalizableProtocol {
        case minCharLimit
        case maxCharLimit
        case noSpecialChar
        case invalid
        case requiredValidation
        case minGroupLimit
        case maxGroupLimit
        case minGroupDescLimit
        case maxGroupDescLimit
    }

    enum LoginPage: String, LocalizableProtocol {
        case forgotPassword
        case notAMember
        case loginValidation
    }

    enum SignupPage: String, LocalizableProtocol {
        case signUpValidation
        case cPasswordValidation
        case tAndC
        case firstName
        case lastName
        case nickName
        case cPassword
        case agreeStatement
        case tAndCLabel
        case alreadyHaveAccount
    }

    enum ForgotPasswordPage: String, LocalizableProtocol {
        case forgotPasswordValidation
        case submit
    }
    enum ChangePasswordPage: String, LocalizableProtocol {
        case changePasswordMatchValidation
    }

    enum DashboardPage: String, LocalizableProtocol {
        case recent
        case groups
        case contacts
        case settings
    }

    enum SelectContactPage: String, LocalizableProtocol {
        case titleSelectContactPage
        case searchBarPlaceholder
    }

    enum ChatPage: String, LocalizableProtocol {
        case searchResultCounter
        case attachmentSizeValidation
    }
//    enum MenuItem: String, LocalizableProtocol {
//        case menuItemCopy
//        case menuItemReply
//        case menuItemDelete
//        case menuItemEdit
//        case menuItemForward
//    }
    enum CreateGroupPage: String, LocalizableProtocol {
        case titleCreateGroupPage
        case titleGroupInfoPage
        case participents
        case createdBy
        case leaveGroup
        case groupAdmin
        case groupNamePlaceholder
        case descriptionPlaceholder
        case add
        case save
        case youHaveRemoved
        case groupCreatedSuccess
        case groupUpdated
        case userRemove
    }
    enum SearchPage: String, LocalizableProtocol {
        case more
        case less
        case contacts
        case groups
    }

    enum InApp: String, LocalizableProtocol {
        case title = "inAppTitle"
        case subtitle = "inAppSubtitle"
        case description = "inAppDescription"

        var table: String? {
            return "InApps"
        }
    }

    enum ForwardPage: String, LocalizableProtocol {
        case titleForwardPage
        case group
        case search
        case notesPlaceholder
        case forwardCellTitle
        case repliedCellTitle
    }

    enum MessageListPage: String, LocalizableProtocol {
        case groupCreated
        case groupMemberAdded
        case groupMemberRemoved
        case groupLeft
        case groupNameChanged
        case groupDescChanged
        case groupIconChanged
        case groupIconRemoved
        case groupDeleted
    }
  enum UserStatus: String, LocalizableProtocol {
        case online
        case offline
    }
    
    enum UserNameChange: String, LocalizableProtocol {
        case changeName
        case changeFName
        case changeLName
        case change
    }
    
    enum LogOut: String,LocalizableProtocol {
        case logout
    }
    
    enum UserImageUpdate: String, LocalizableProtocol {
        case selectImage
        case captureImage
        case removeImage
        case takeImage
        case removePicture
        case removeYourProfilePicture
    }
}
