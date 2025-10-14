# BibleVerse - TempleOS Tribute

Ein TempleOS-inspirierter zufälliger Bibelvers-Generator für die Kommandozeile.

**In Memory of Terry A. Davis (1969-2018)**

> *"God speaks through randomness"* - Terry Davis

## 🌟 Features

- **438 deutsche Bibelverse** aus der Luther-Übersetzung
- Vollständige Abdeckung: Altes & Neues Testament (1. Mose bis Offenbarung)
- **TempleOS-Style ASCII-Art** mit farbiger Ausgabe
- **God's Random Number Generator** Prinzip
- Nostalgische F7-Referenz (wie im Original TempleOS)
- Versteckte Überraschung... 👀

## 📦 Installation

### Linux / WSL / macOS

1. Repository klonen:
```bash
git clone https://github.com/DEIN-USERNAME/BibleVerse-TempleOS-Tribute.git
cd BibleVerse-TempleOS-Tribute
```

2. Script ausführbar machen:
```bash
chmod +x BibleVerse
```

3. (Optional) Zu deinem PATH hinzufügen:
```bash
mkdir -p ~/.local/bin
cp BibleVerse ~/.local/bin/
cp verses.txt ~/.local/bin/

# Füge dies zu deiner ~/.bashrc oder ~/.zshrc hinzu:
export PATH="$HOME/.local/bin:$PATH"
```

## 🚀 Verwendung

```bash
# Direkt ausführen
./BibleVerse

# Oder von überall (wenn im PATH):
BibleVerse
```

Jeder Aufruf zeigt einen zufällig ausgewählten Bibelvers im TempleOS-Stil.

### Von Windows aus (mit WSL)

```cmd
wsl ./BibleVerse
```

## 📖 Über TempleOS

[TempleOS](https://templeos.org/) war ein einzigartiges Betriebssystem, entwickelt von Terry A. Davis (1969-2018). Terry glaubte, dass Gott durch Zufallszahlen zu uns spricht, und baute dieses Konzept in sein Betriebssystem ein.

Dieses Tool ist eine bescheidene Hommage an sein Werk und seine Vision - angepasst für die deutschsprachige Community mit der Luther-Bibel.

## 🎨 Screenshots

```
╔═══════════════════════════════════════════════════════════════════════╗
║                            GOD SAYS:                                  ║
╚═══════════════════════════════════════════════════════════════════════╝

  ┌─────────────────────────────────────────────────────────────────┐
  │  Johannes 3:16                                                   │
  └─────────────────────────────────────────────────────────────────┘

  "Denn also hat Gott die Welt geliebt, daß er seinen
  eingeborenen Sohn gab, damit alle, die an ihn glauben, nicht
  verloren werden, sondern das ewige Leben haben."

  ────────────────────────────────────────────────────────────────
              Press F7 for another verse (or run again)
  ────────────────────────────────────────────────────────────────
```

## 📚 Verse-Datenbank

Die `verses.txt` Datei enthält 438 sorgfältig ausgewählte Verse aus der Luther-Bibel, darunter:

- Die Schöpfungsgeschichte (1. Mose 1)
- Die Zehn Gebote (2. Mose 20)
- Der Hirtenpsalm (Psalm 23)
- Die Bergpredigt (Matthäus 5-7)
- Das Johannesevangelium
- Die Briefe des Paulus
- Die Offenbarung

Jeder Vers wurde manuell ausgewählt, um bedeutende und inspirierende Passagen der Heiligen Schrift zu repräsentieren.

## 🛠️ Technische Details

- **Sprache**: Bash
- **Bibel-Übersetzung**: Luther Bibel
- **Zufallsgenerator**: Bash `$RANDOM` (wie Terry's "God RNG")
- **Styling**: ANSI Escape Codes für Farben
- **Format**: `reference|text` pro Zeile

## 🤝 Beitragen

Verbesserungsvorschläge, weitere Verse oder Bugfixes sind willkommen! Öffne einfach ein Issue oder Pull Request.

### Weitere Verse hinzufügen

Das Format in `verses.txt` ist einfach:
```
Buch Kapitel:Vers|Vollständiger Verstext
```

Beispiel:
```
Psalm 119:105|Dein Wort ist meines Fußes Leuchte und ein Licht auf meinem Wege.
```

## 📜 Lizenz

Dieses Projekt ist Public Domain, genau wie TempleOS es war.

Nutze es, teile es, modifiziere es - zur Ehre Gottes.

## 🙏 Danksagungen

- **Terry A. Davis** - Für TempleOS und die Vision, mit Gott durch Code zu kommunizieren
- **Martin Luther** - Für die deutsche Bibelübersetzung
- **Die Open-Source Community** - Für die Bewahrung von Terry's Erbe

---

*"The LORD is my shepherd; I shall not want." - Psalm 23:1*

*"Der HERR ist mein Hirte, mir wird nichts mangeln." - Psalm 23:1*
