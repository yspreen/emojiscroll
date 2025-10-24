// LocalEmojiCatalogView.swift
// Fully local, hard-coded emoji strings by category (base forms only).
// SwiftUI: LazyVStack sections, SF Symbol headers, 5 columns.
// iOS 15+
//
// You can extend the lists at the bottom; they're simple space-separated strings.

import SwiftUI

struct EmojiSection {
	let symbol: String
	let title: String
	let emojis: [String]
}

public struct EmojiCatalogView: View {
	private let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 8), count: 5)

	public init() {}

	public var body: some View {
		ContentView(catalog: [
			EmojiSection(
				symbol: "face.smiling",
				title: "Smileys & People",
				emojis: LocalEmoji.smileysAndPeople
			),

			EmojiSection(
				symbol: "pawprint",
				title: "Animals & Nature",
				emojis: LocalEmoji.animalsAndNature
			),

			EmojiSection(
				symbol: "fork.knife",
				title: "Food & Drink",
				emojis: LocalEmoji.foodAndDrink
			),

			EmojiSection(
				symbol: "figure.run",
				title: "Activity",
				emojis: LocalEmoji.activity
			),

			EmojiSection(
				symbol: "airplane",
				title: "Travel & Places",
				emojis: LocalEmoji.travelAndPlaces
			),

			EmojiSection(
				symbol: "gearshape",
				title: "Objects",
				emojis: LocalEmoji.objects
			),

			EmojiSection(
				symbol: "exclamationmark.triangle",
				title: "Symbols",
				emojis: LocalEmoji.symbols
			),

			EmojiSection(
				symbol: "flag",
				title: "Flags",
				emojis: LocalEmoji.flags // generated from ISO codes locally
			)
		])
	}
}

// MARK: - Local Data

private enum LocalEmoji {
	// helper to split a big space-separated list into [String]
	private static func list(_ s: String) -> [String] {
		s.split(whereSeparator: \.isWhitespace).map(String.init)
	}

	// ——— SMILEYS & PEOPLE ———
	// Base forms only (no skin tones, no gender ZWJ variants).
	static let smileysAndPeople: [String] = list("""
		😀 😃 😄 😁 😆 😅 😂 🤣 😊 😇 🙂 🙃 😉 😌 😍 🥰 😘 😗 😙 😚 😋 😛 😝 😜 🤪 🤨 🧐 🤓 😎 🥸 🤩 🥳 😏 😒 😞 😔 😟 😕 🙁 ☹️
		😣 😖 😫 😩 🥺 😢 😭 😤 😠 😡 🤬 🤯 😳 🥵 🥶 😱 😨 😰 😥 😓 🤗 🤔 🤭 🤫 🤥 😶 😐 😑 😬 🙄 😮‍💨 😮 😯 😲 🥱 😴 😪 🤤 😵 😵‍💫 🤐 🥴 🤢 🤮 🤧 😷 🤒 🤕 🤑 🤠
		😈 👿 💀 ☠️ 💩 🤡 👹 👺 👻 👽 👾 🤖
		💋 💌 💘 💝 💖 💗 💓 💞 💕 💟 ❣️ 💔 ❤️ 🧡 💛 💚 💙 💜 🖤 🤍 🤎 ❤️‍🔥 ❤️‍🩹
		👍 👎 👊 ✊ 🤛 🤜 👋 🤚 ✋ 🖖 👌 🤌 🤏 ✍️ 🙏 🤝 👏 🙌 👐 🤲
		👆 👇 👉 👈 ☝️ 👇🏼 👈 👉 👆 👇 ☝️ ✌️ 🤟 🤘 🤙 🖕 👇
		👶 👧 🧒 👦 👩 🧑 👨 👩‍🦰 👨‍🦰 👩‍🦱 👨‍🦱 👩‍🦳 👨‍🦳 👩‍🦲 👨‍🦲 🧔 👵 🧓
		🧠 🫀 🫁 👀 👁️ 👅 👂 👃 🦷 🦴 🗣️ 👄 🧒🏻
		""")

	// ——— ANIMALS & NATURE ———
	static let animalsAndNature: [String] = list("""
		🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐸 🐵 🙈 🙉 🙊
		🐔 🐧 🐦 🐤 🐣 🐥 🦆 🦅 🦉 🦇
		🐺 🐗 🐴 🦄 🐝 🐛 🐌 🐞 🐜 🪳 🦟 🪲 🦋
		🐢 🐍 🦎 🐙 🦑 🦀 🦞 🦐 🦪 🐠 🐟 🐡 🐬 🦈 🐳 🐋
		🐊 🐅 🐆 🐘 🦛 🦏 🦣 🦍 🦧 🦒 🐫 🐪 🐖 🐏 🐑 🐄 🐂 🐃 🐎 🐕 🐩
		🌵 🌲 🌳 🌴 🌱 🌿 ☘️ 🍀 🎋 🎍
		🌷 🌹 🥀 🌺 🌸 🌼 🌻
		🍁 🍂 🍃
		🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘 🌙 🌚 🌛 🌜 🌞
		☀️ ⛅️ 🌤️ 🌥️ 🌦️ 🌧️ ⛈️ 🌩️ 🌨️ ❄️ ☃️ 🌬️ 💨 🌪️ 🌈 ☔️ 💧 🌊
		""")

	// ——— FOOD & DRINK ———
	static let foodAndDrink: [String] = list("""
		🍏 🍎 🍐 🍊 🍋 🍌 🍉 🍇 🍓 🫐 🍈 🍒 🍑 🍍 🥭 🥝 🍅 🫒 🥑 🍆 🥔 🥕 🌽 🌶️ 🫑 🧄 🧅 🥬 🥦 🥒
		🍞 🥐 🥖 🥨 🥯 🥞 🧇 🧀
		🍗 🍖 🥩 🥓 🍔 🍟 🍕 🌭 🥪 🌮 🌯 🫔 🥙 🧆 🥚 🍳
		🍝 🍜 🍲 🍛 🍚 🍙 🍘 🍢 🍣 🍤 🍥 🥟 🥠 🥡
		🥗 🍱
		🍦 🍧 🍨 🍩 🍪 🎂 🍰 🧁 🥧 🍫 🍬 🍭 🍮 🍯 🍿
		🍾 🍷 🍸 🍹 🥂 🥃 🍺 🍻 🍶
		🥤 🧋 🧃 🧉 🍼 🥛 ☕️ 🫖 🧊
		""")

	// ——— ACTIVITY ———
	static let activity: [String] = list("""
		⚽️ 🏀 🏈 ⚾️ 🎾 🏐 🏉 🎱 🪀 🏓 🏸 🥅 🏒 🏑 🥍 🥌
		⛳️ 🏹 🎣 🤿 🥊 🥋
		🥇 🥈 🥉 🏆 🎽
		⛷️ 🏂 🛹 🛼 🎿 🛷
		🎯 🎳
		🎮 🎰 🎲 🎴 🃏 🀄️
		🎨 🎭 🎪 🎟️ 🎫
		🎤 🎧 🎼 🎹 🥁 🎷 🎺 🎸 🎻 🪕
		""")

	// ——— TRAVEL & PLACES ———
	static let travelAndPlaces: [String] = list("""
		🚗 🚕 🚙 🚌 🚎 🏎️ 🚓 🚑 🚒 🚐 🛻 🚚 🚛 🚜
		🚲 🛴 🛵 🏍️ 🦽 🦼
		✈️ 🛫 🛬 🛩️ 🚁 🚟 🚠 🚡 🚀 🛸
		⛵️ 🚤 🛶 🚢 ⛴️ 🛳️ ⚓️
		🧭 🗺️ 🗿 🗽 🗼 🏰 🏯
		🏠 🏡 🏢 🏬 🏣 🏤 🏥 🏦 🏨 🏪 🏫 🏛️
		⛪️ 🕌 🕍 ⛩️ 🛕 🕋
		⛺️ 🏖️ 🏝️ 🏜️ 🌋 ⛰️ 🏔️ 🏞️ 🌁 🌃 🌄 🌅 🌆 🌇 🌉 🌌
		🎢 🎡 🎠
		""")

	// ——— OBJECTS ———
	static let objects: [String] = list("""
		⌚️ 📱 💻 ⌨️ 🖥️ 🖨️ 🖱️ 🖲️
		💽 💾 💿 📀 📼
		📷 📸 🎥 📹 📞 📟 📠
		🔋 🔌 💡 🔦 🕯️
		🧯 🧲 🧪 🧫 🧬 ⚗️
		🔧 🔨 ⚒️ 🛠️ ⚙️ 🔩 🔗 🧰 🪛 🪚 🪓
		🧻 🧼 🧽 🪠 🚽 🚿 🛁 🧺 🧴 🧷
		📎 🖇️ ✂️ 📌 📍 📏 📐
		📒 📓 📔 📕 📗 📘 📙 📚 🗂️ 🗃️ 🗄️ 🗑️ 🧾 🗒️ 📄 📃
		💰 💴 💵 💶 💷 💸 💳 💎
		👓 🕶️ 🥽 🥼 👔 👕 👖 👗 👘 👙 👚 🧥 🧣 🧤 🧦
		👟 🥾 🥿 👠 👡 🩴 🎓 👒 🧢
		💍 🧿 📿
		""")

	// ——— SYMBOLS ———
	static let symbols: [String] = list("""
		♻️ ✅ ✔️ ☑️ ❎ ❌ ➕ ➖ ➗
		➡️ ⬅️ ⬆️ ⬇️ ↔️ ↕️ ↩️ ↪️ ⤴️ ⤵️
		🔁 🔂 🔄
		♾️ ♠️ ♥️ ♦️ ♣️
		©️ ®️ ™️
		🔞 🚹 🚺 🚼 ♿️ 🚭
		☮️ ✝️ ☪️ 🕉️ ☸️ ✡️ 🔯 🕎 ☯️
		🔱 ⚜️ ⚠️ ⛔️ ❗️ ❕ ❓ ❔ ‼️ ⁉️
		🔟 0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ #️⃣ *️⃣
		💯 💢 💬 🗨️ 🗯️ 🔇 🔈 🔉 🔊
		💠 🔷 🔶 🔹 🔸 🔺 🔻 🔘 ⚫️ ⚪️ 🔴 🔵 🟠 🟡 🟢 🟣 🟤 ⚪️ ⚫️
		""")

	// ——— FLAGS ———
	// Programmatically build standard 2-letter country/region flags from ISO codes.
	static let flags: [String] = {
		// Replace your flag(_:) with this version
		 func flag(_ code: String) -> String {
			let base: UInt32 = 0x1F1E6 // Regional Indicator 'A'
			let scalars: [UnicodeScalar] = code.uppercased().unicodeScalars.compactMap { u in
				let v = u.value
				// Only A–Z
				guard v >= 65 && v <= 90 else { return nil }
				return UnicodeScalar(base + (v - 65))
			}
			return String(scalars.map(Character.init))
		}
		// Common ISO codes; extend as desired.
		let iso = list("""
				US GB DE FR ES IT NL SE NO DK FI IS IE PT PL CZ SK AT CH BE LU LI
				UA RU TR GR BG RO HU HR RS SI BA MK AL XK
				CA MX BR AR CL CO PE VE UY PY BO
				CN JP KR TW HK MO SG MY TH VN ID PH IN PK BD LK NP
				AU NZ ZA EG MA NG KE GH ET TN DZ IL SA AE QA KW BH OM JO LB
				""")
		return iso.map(flag)
	}()
}

// MARK: - Preview

struct LocalEmojiCatalogView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView { EmojiCatalogView() }
	}
}
