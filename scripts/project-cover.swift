// Builds a 1600x900 dark project cover: title + subtitle on the left, iPhone screenshots in frames on the right.
// Usage: [NO_FRAME=1] swift scripts/project-cover.swift "<title>" "<subtitle>" out.png shot1.png [shot2.png ...]
// NO_FRAME=1 for screenshots that already include a device frame (e.g. Sketch mockups).
import AppKit

let args = CommandLine.arguments
guard args.count >= 5 else { print("usage: title subtitle out.png shots..."); exit(1) }
let (title, subtitle, out) = (args[1], args[2], args[3])
let shots = args[4...].map { NSImage(contentsOfFile: $0)! }

let W: CGFloat = 1600, H: CGFloat = 900
let img = NSImage(size: NSSize(width: W, height: H))
img.lockFocus()

NSGradient(starting: NSColor(calibratedRed: 0.16, green: 0.16, blue: 0.18, alpha: 1),
           ending: NSColor(calibratedRed: 0.07, green: 0.07, blue: 0.08, alpha: 1))!
  .draw(in: NSRect(x: 0, y: 0, width: W, height: H), angle: -60)

// Phones, right-aligned, overlapping slightly.
let noFrame = ProcessInfo.processInfo.environment["NO_FRAME"] == "1"
let phoneH: CGFloat = 760, bezel: CGFloat = 12, gap: CGFloat = 40
let phoneW = phoneH * shots[0].size.width / shots[0].size.height
var x = W - 80 - CGFloat(shots.count) * phoneW - CGFloat(shots.count - 1) * gap
for (i, shot) in shots.enumerated() {
  let y = (H - phoneH) / 2 + (i % 2 == 0 ? 20 : -20)
  let frame = NSRect(x: x, y: y, width: phoneW, height: phoneH)
  if noFrame { shot.draw(in: frame); x += phoneW + gap; continue }
  let shadow = NSShadow(); shadow.shadowBlurRadius = 40; shadow.shadowOffset = NSSize(width: 0, height: -12)
  shadow.shadowColor = NSColor.black.withAlphaComponent(0.6)
  NSGraphicsContext.saveGraphicsState(); shadow.set()
  NSColor(calibratedWhite: 0.12, alpha: 1).setFill()
  NSBezierPath(roundedRect: frame, xRadius: 64, yRadius: 64).fill()
  NSGraphicsContext.restoreGraphicsState()
  let screen = frame.insetBy(dx: bezel, dy: bezel)
  NSGraphicsContext.saveGraphicsState()
  NSBezierPath(roundedRect: screen, xRadius: 54, yRadius: 54).addClip()
  shot.draw(in: screen)
  NSGraphicsContext.restoreGraphicsState()
  x += phoneW + gap
}

// Text block on the left.
let textW = x - phoneW * CGFloat(shots.count) - gap * CGFloat(shots.count) - 80 - 60
let para = NSMutableParagraphStyle(); para.lineBreakMode = .byWordWrapping
(title as NSString).draw(in: NSRect(x: 80, y: H / 2 - 10, width: textW, height: 200), withAttributes: [
  .font: NSFont.systemFont(ofSize: 76, weight: .bold), .foregroundColor: NSColor.white, .paragraphStyle: para])
(subtitle as NSString).draw(in: NSRect(x: 80, y: H / 2 - 170, width: textW, height: 150), withAttributes: [
  .font: NSFont.systemFont(ofSize: 34, weight: .medium), .foregroundColor: NSColor(calibratedWhite: 0.7, alpha: 1), .paragraphStyle: para])

img.unlockFocus()
let rep = NSBitmapImageRep(data: img.tiffRepresentation!)!
try! rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: out))
