//
//  UIDevice+Model.swift
//
//  Created by Rui Aureliano on 13/11/2020.
//

import UIKit

extension UIDevice {

	enum Model: String {

		// Simulator
		case simulator = "Simulator"
		// iPod
		case iPod1 = "iPod 1"
		case iPod2 = "iPod 2"
		case iPod3 = "iPod 3"
		case iPod4 = "iPod 4"
		case iPod5 = "iPod 5"
		case iPod6 = "iPod 6"
		case iPod7 = "iPod 7"

		// iPad
		case iPad2 = "iPad 2"
		case iPad3 = "iPad 3"
		case iPad4 = "iPad 4"
		case iPadAir = "iPad Air "
		case iPadAir2 = "iPad Air 2"
		case iPadAir3 = "iPad Air 3"
		case iPadAir4 = "iPad Air 4"
		case iPad5 = "iPad 5"  //iPad 2017
		case iPad6 = "iPad 6"  //iPad 2018
		case iPad7 = "iPad 7"  //iPad 2019
		case iPad8 = "iPad 8"  //iPad 2020

		// iPad Mini
		case iPadMini = "iPad Mini"
		case iPadMini2 = "iPad Mini 2"
		case iPadMini3 = "iPad Mini 3"
		case iPadMini4 = "iPad Mini 4"
		case iPadMini5 = "iPad Mini 5"

		// iPad Pro
		case iPadPro9_7 = "iPad Pro 9.7\""
		case iPadPro10_5 = "iPad Pro 10.5\""
		case iPadPro11 = "iPad Pro 11\""
		case iPadPro2_11 = "iPad Pro 11\" 2nd gen"
		case iPadPro12_9 = "iPad Pro 12.9\""
		case iPadPro2_12_9 = "iPad Pro 2 12.9\""
		case iPadPro3_12_9 = "iPad Pro 3 12.9\""
		case iPadPro4_12_9 = "iPad Pro 4 12.9\""

		// iPhone
		case iPhone4 = "iPhone 4"
		case iPhone4S = "iPhone 4S"
		case iPhone5 = "iPhone 5"
		case iPhone5S = "iPhone 5S"
		case iPhone5C = "iPhone 5C"
		case iPhone6 = "iPhone 6"
		case iPhone6Plus = "iPhone 6 Plus"
		case iPhone6S = "iPhone 6S"
		case iPhone6SPlus = "iPhone 6S Plus"
		case iPhoneSE = "iPhone SE"
		case iPhone7 = "iPhone 7"
		case iPhone7Plus = "iPhone 7 Plus"
		case iPhone8 = "iPhone 8"
		case iPhone8Plus = "iPhone 8 Plus"
		case iPhoneX = "iPhone X"
		case iPhoneXS = "iPhone XS"
		case iPhoneXSMax = "iPhone XS Max"
		case iPhoneXR = "iPhone XR"
		case iPhone11 = "iPhone 11"
		case iPhone11Pro = "iPhone 11 Pro"
		case iPhone11ProMax = "iPhone 11 Pro Max"
		case iPhoneSE2 = "iPhone SE 2nd gen"
		case iPhone12Mini = "iPhone 12 Mini"
		case iPhone12 = "iPhone 12"
		case iPhone12Pro = "iPhone 12 Pro"
		case iPhone12ProMax = "iPhone 12 Pro Max"

		// Apple Watch
		case AppleWatch1 = "Apple Watch 1gen"
		case AppleWatchS1 = "Apple Watch Series 1"
		case AppleWatchS2 = "Apple Watch Series 2"
		case AppleWatchS3 = "Apple Watch Series 3"
		case AppleWatchS4 = "Apple Watch Series 4"
		case AppleWatchS5 = "Apple Watch Series 5"
		case AppleWatchSE = "Apple Watch Special Edition"
		case AppleWatchS6 = "Apple Watch Series 6"

		// Apple TV
		case AppleTV1 = "Apple TV 1gen"
		case AppleTV2 = "Apple TV 2gen"
		case AppleTV3 = "Apple TV 3gen"
		case AppleTV4 = "Apple TV 4gen"
		case AppleTV_4K = "Apple TV 4K"

		// Unknown
		case unknown
	}

	static var model: Model {
		var systemInfo = utsname()
		uname(&systemInfo)
		guard
			let code =
				(withUnsafePointer(to: &systemInfo.machine) {
					$0.withMemoryRebound(to: CChar.self, capacity: 1) {
						ptr in String.init(validatingUTF8: ptr)
					}
				})
		else {
			return .unknown
		}

		let map: [String: Model] = [
			//Simulator
			"i386": .simulator,
			"x86_64": .simulator,

			//iPod
			"iPod1,1": .iPod1,
			"iPod2,1": .iPod2,
			"iPod3,1": .iPod3,
			"iPod4,1": .iPod4,
			"iPod5,1": .iPod5,
			"iPod7,1": .iPod6,
			"iPod9,1": .iPod7,

			//iPad
			"iPad2,1": .iPad2,
			"iPad2,2": .iPad2,
			"iPad2,3": .iPad2,
			"iPad2,4": .iPad2,
			"iPad3,1": .iPad3,
			"iPad3,2": .iPad3,
			"iPad3,3": .iPad3,
			"iPad3,4": .iPad4,
			"iPad3,5": .iPad4,
			"iPad3,6": .iPad4,
			"iPad6,11": .iPad5,  //iPad 2017
			"iPad6,12": .iPad5,
			"iPad7,5": .iPad6,  //iPad 2018
			"iPad7,6": .iPad6,
			"iPad7,11": .iPad7,  //iPad 2019
			"iPad7,12": .iPad7,
			"iPad11,6": .iPad8,  //iPad 2020
			"iPad11,7": .iPad8,

			//iPad Mini
			"iPad2,5": .iPadMini,
			"iPad2,6": .iPadMini,
			"iPad2,7": .iPadMini,
			"iPad4,4": .iPadMini2,
			"iPad4,5": .iPadMini2,
			"iPad4,6": .iPadMini2,
			"iPad4,7": .iPadMini3,
			"iPad4,8": .iPadMini3,
			"iPad4,9": .iPadMini3,
			"iPad5,1": .iPadMini4,
			"iPad5,2": .iPadMini4,
			"iPad11,1": .iPadMini5,
			"iPad11,2": .iPadMini5,

			//iPad Pro
			"iPad6,3": .iPadPro9_7,
			"iPad6,4": .iPadPro9_7,
			"iPad7,3": .iPadPro10_5,
			"iPad7,4": .iPadPro10_5,
			"iPad6,7": .iPadPro12_9,
			"iPad6,8": .iPadPro12_9,
			"iPad7,1": .iPadPro2_12_9,
			"iPad7,2": .iPadPro2_12_9,
			"iPad8,1": .iPadPro11,
			"iPad8,2": .iPadPro11,
			"iPad8,3": .iPadPro11,
			"iPad8,4": .iPadPro11,
			"iPad8,9": .iPadPro2_11,
			"iPad8,10": .iPadPro2_11,
			"iPad8,5": .iPadPro3_12_9,
			"iPad8,6": .iPadPro3_12_9,
			"iPad8,7": .iPadPro3_12_9,
			"iPad8,8": .iPadPro3_12_9,
			"iPad8,11": .iPadPro4_12_9,
			"iPad8,12": .iPadPro4_12_9,

			//iPad Air
			"iPad4,1": .iPadAir,
			"iPad4,2": .iPadAir,
			"iPad4,3": .iPadAir,
			"iPad5,3": .iPadAir2,
			"iPad5,4": .iPadAir2,
			"iPad11,3": .iPadAir3,
			"iPad11,4": .iPadAir3,
			"iPad13,1": .iPadAir4,
			"iPad13,2": .iPadAir4,

			//iPhone
			"iPhone3,1": .iPhone4,
			"iPhone3,2": .iPhone4,
			"iPhone3,3": .iPhone4,
			"iPhone4,1": .iPhone4S,
			"iPhone5,1": .iPhone5,
			"iPhone5,2": .iPhone5,
			"iPhone5,3": .iPhone5C,
			"iPhone5,4": .iPhone5C,
			"iPhone6,1": .iPhone5S,
			"iPhone6,2": .iPhone5S,
			"iPhone7,1": .iPhone6Plus,
			"iPhone7,2": .iPhone6,
			"iPhone8,1": .iPhone6S,
			"iPhone8,2": .iPhone6SPlus,
			"iPhone8,4": .iPhoneSE,
			"iPhone9,1": .iPhone7,
			"iPhone9,3": .iPhone7,
			"iPhone9,2": .iPhone7Plus,
			"iPhone9,4": .iPhone7Plus,
			"iPhone10,1": .iPhone8,
			"iPhone10,4": .iPhone8,
			"iPhone10,2": .iPhone8Plus,
			"iPhone10,5": .iPhone8Plus,
			"iPhone10,3": .iPhoneX,
			"iPhone10,6": .iPhoneX,
			"iPhone11,2": .iPhoneXS,
			"iPhone11,4": .iPhoneXSMax,
			"iPhone11,6": .iPhoneXSMax,
			"iPhone11,8": .iPhoneXR,
			"iPhone12,1": .iPhone11,
			"iPhone12,3": .iPhone11Pro,
			"iPhone12,5": .iPhone11ProMax,
			"iPhone12,8": .iPhoneSE2,
			"iPhone13,1": .iPhone12Mini,
			"iPhone13,2": .iPhone12,
			"iPhone13,3": .iPhone12Pro,
			"iPhone13,4": .iPhone12ProMax,

			// Apple Watch
			"Watch1,1": .AppleWatch1,
			"Watch1,2": .AppleWatch1,
			"Watch2,6": .AppleWatchS1,
			"Watch2,7": .AppleWatchS1,
			"Watch2,3": .AppleWatchS2,
			"Watch2,4": .AppleWatchS2,
			"Watch3,1": .AppleWatchS3,
			"Watch3,2": .AppleWatchS3,
			"Watch3,3": .AppleWatchS3,
			"Watch3,4": .AppleWatchS3,
			"Watch4,1": .AppleWatchS4,
			"Watch4,2": .AppleWatchS4,
			"Watch4,3": .AppleWatchS4,
			"Watch4,4": .AppleWatchS4,
			"Watch5,1": .AppleWatchS5,
			"Watch5,2": .AppleWatchS5,
			"Watch5,3": .AppleWatchS5,
			"Watch5,4": .AppleWatchS5,
			"Watch5,9": .AppleWatchSE,
			"Watch5,10": .AppleWatchSE,
			"Watch5,11": .AppleWatchSE,
			"Watch5,12": .AppleWatchSE,
			"Watch6,1": .AppleWatchS6,
			"Watch6,2": .AppleWatchS6,
			"Watch6,3": .AppleWatchS6,
			"Watch6,4": .AppleWatchS6,

			//Apple TV
			"AppleTV1,1": .AppleTV1,
			"AppleTV2,1": .AppleTV2,
			"AppleTV3,1": .AppleTV3,
			"AppleTV3,2": .AppleTV3,
			"AppleTV5,3": .AppleTV4,
			"AppleTV6,2": .AppleTV_4K,
		]

		guard let model = map[code] else {
			return .unknown
		}
		return model
	}
}
