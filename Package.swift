// swift-tools-version:5.0
import PackageDescription

let package = Package(
	name: "CwlPreconditionTesting",
	platforms: [.iOS(.v9), .macOS(.v10_10), .watchOS(.v3), .tvOS(.v9)],
	products: [
		.library(name: "CwlPreconditionTesting", targets: ["CwlPreconditionTesting", "CwlMachBadInstructionHandler"]),
		.library(name: "CwlPosixPreconditionTesting", targets: ["CwlPosixPreconditionTesting"])
	],
	dependencies: [
		.package(url: "https://github.com/jsmi1417-ford/CwlCatchException.git", .branch("patch-1"))
	],
	targets: [
		.target(
			name: "CwlPreconditionTesting",
			dependencies: [
				.target(name: "CwlMachBadInstructionHandler"),
				.product(name: "CwlCatchException")
			]
		),
		.target(
			name: "CwlPosixPreconditionTesting"
		),
		.target(name: "CwlMachBadInstructionHandler"),
		.testTarget(name: "CwlPreconditionTestingTests", dependencies: ["CwlPreconditionTesting", "CwlPosixPreconditionTesting"])
	]
)
