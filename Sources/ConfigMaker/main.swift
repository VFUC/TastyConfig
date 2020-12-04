// Created on 04.12.20

import Foundation

print("Generating config file...")
do {
		try ConfigMaker.makeConfig()
} catch {
		print(error.localizedDescription)
}
print("... done!")
