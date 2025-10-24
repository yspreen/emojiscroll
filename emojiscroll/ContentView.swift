//
/**
 * ContentView.swift
 * emojiscroll
 *
 * Created by Nick Spreen (spreen.co) on 10/24/25.
 *
 */

import SwiftUI

let rowCount = 4

struct ContentView: View {
	init(catalog: [EmojiSection]) {
		var cols: [[String]] = []
		var icons: [String] = []
		var sectionIndexes: [Int] = []

		for category in catalog {
			sectionIndexes.append(cols.count)
			icons.append(category.symbol)
			var emojis = category.emojis
			while emojis.count >= rowCount {
				cols.append(Array(emojis.prefix(rowCount)))
				emojis = Array(emojis.suffix(emojis.count - rowCount))
			}
			if !emojis.isEmpty {
				cols.append(emojis + Array(repeating: "", count: rowCount - emojis.count))
			}
		}

		self.cols = cols
		self.icons = icons
		self.sectionIndexes = sectionIndexes
	}

	let cols: [[String]]
	let icons: [String]
	let sectionIndexes: [Int]

	@State var active: Int = 0
	@State var scroll: ScrollViewProxy?

	var cellSize: CGFloat {
		CGFloat(200 / rowCount)
	}

	var body: some View {
		VStack(spacing: 12) {
			ScrollViewReader { scroll in
				ScrollView(.horizontal) {
					LazyHStack(spacing: 0) {
						ForEach((0..<cols.count).map { ($0, "col.\($0)") }, id: \.1) {	colIdx, _ in
							VStack(spacing: 0) {
								ForEach((0..<cols[colIdx].count).map { ($0, "cell.\(colIdx).\($0)") }, id: \.1) {	rowIdx, _ in
									Color.clear.frame(width: cellSize, height: cellSize)
										.overlay {
											Text(cols[colIdx][rowIdx])
												.font(.system(size: 40))
												.minimumScaleFactor(0.1)
										}
								}
							}
							.geometryGroup()
							.frame(width: cellSize)
						}
					}
					.frame(height: 200)
					.task {
						self.scroll = scroll
					}
					.overlay {
						GeometryReader { geo in
							if #available(iOS 17.0, *) {
								Color.clear.onChange(of: geo.frame(in: .global).minX) {
									let offset = -$1
									let col = Int(offset / cellSize + 0.5)
									while active < icons.count - 1, sectionIndexes[active + 1] <= col {
										active += 1
									}
									while active > 0, sectionIndexes[active - 1] >= col {
										active -= 1
									}
								}
							} else {
								Color.clear.onChange(of: geo.frame(in: .global).minX) {
									let offset = -$0
									let col = Int(offset / cellSize + 0.5)
									while active < icons.count - 1, sectionIndexes[active + 1] <= col {
										active += 1
									}
									while active > 0, sectionIndexes[active - 1] >= col {
										active -= 1
									}
								}
							}
						}
					}
				}
			}
			HStack {
				ForEach(Array(0..<icons.count), id: \.self) { idx in
					Spacer()
					Button {
						withAnimation(.linear(duration: 0.1)) {
							scroll?.scrollTo("col.\(sectionIndexes[idx])", anchor: .leading)
						}
					} label: {
						Image(systemName: icons[idx])
							.opacity(idx == active ? 1 : 0.3)
							.font(.system(size: 24))
					}
				}
				Spacer()
			}
		}
		.padding(.vertical, 12)
		.background {
			Color.secondary.opacity(0.1)
		}
	}
}

#Preview {
	EmojiCatalogView()
}
