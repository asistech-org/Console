import Foundation

let console = Console()

if let a = console.readInt() {
    print(a + 1)
} else {
    print(console.report.message)
}
