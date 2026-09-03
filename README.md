# 📷 Dual DJI Osmo Action 4 Rig (80° V-Mount)

[![PhythonSCAD](https://img.shields.io/badge/CAD-OpenSCAD-orange.svg)](https://www.pythonscad.org/)
[![3D Print Ready](https://img.shields.io/badge/3D%20Print-PETG%20%7C%20PETG--CF-blue.svg)](#-druckempfehlungen--slicer-einstellungen)
[![Status](https://img.shields.io/badge/Status-Production%20Ready-success.svg)](#)
[![Compatibility](https://img.shields.io/badge/Cameras-2x%20DJI%20Osmo%20Action%204-red.svg)](#)

Ein professionelles, vollständig parametrisches 3D-Druck-Rig für **zwei DJI Osmo Action 4** Kameras, konstruiert in **OpenSCAD**.

Entwickelt für Weitwinkel-Aufzeichnungen, Stereo-Setups, Sport-Tracking und Livestreaming. Das Gehäuse bietet ein durchdachtes Kabel- und Energiemanagement mit unsichtbar integrierter Powerbank-Garage, dauerhafter USB-C-Stromversorgung und einem massiven **Rain Shield (Regenschutz)** für wetterfeste Außeneinsätze.

---

## 📑 Inhaltsverzeichnis

- [✨ Features](#-features)
- [🛠️ Stückliste (BOM) & Hardware](#️-stückliste-bom--hardware)
- [📂 Projekt- & Dateistruktur](#-projekt--dateistruktur)
- [🖨️ 3D-Druck & Render-Modi](#️-3d-druck--render-modi)
  - [OpenSCAD Render-Modi](#openscad-render-modi)
  - [Druckempfehlungen & Slicer-Einstellungen](#druckempfehlungen--slicer-einstellungen)
- [⚙️ Parametrische Anpassung](#️-parametrische-anpassung)
- [🚀 Montageanleitung](#-montageanleitung)

---

## ✨ Features

- **📐 Präzise Geometrie:** 80° horizontale Spreizung und konfigurierbarer Neigungswinkel (Tilt, z. B. 20° nach unten gerichtet).
- **🌧️ Rain Shield Deckel:** Alternativer Top-Cover-Deckel mit breiter Krempe und bündigen Schraubensenkungen – maximaler Schutz vor Regen ohne Sichtfeldeinschränkung der Linsen.
- **🔋 Integrierte Powerbank-Garage:** Horizontaler Einschub von hinten im vorderen "V" des Rigs. Geschützt im Gehäuseinneren, mit frontseitigem Auswurfloch und rückwärtigen Kabelkanälen.
- **⚡ Continuous Power:** Saubere USB-C-Aussparungen an beiden Kamera-Bays zur direkten Verkabelung von der zentralen Powerbank.
- **❄️ Thermomanagement:** Strategisch platzierte Belüftungsschlitze (*Ventilation Slots*) verhindern Hitzestau bei Daueraufnahmen.
- **🏷️ Individualisierbar:** Frontseitig eingelassenes Trapez-Emblem für eigenes Branding (ideal für Single- oder Multi-Color-Druck).
- **🔩 Solide Stativaufnahme:** Integrierter Kragen für ein standardmäßiges 1/4"-Stativgewinde an der massiven Unterseite.

---

## 🛠️ Stückliste (BOM) & Hardware

| Komponente | Anzahl | Beschreibung / Empfehlung |
| :--- | :---: | :--- |
| **Kameras** | 2× | DJI Osmo Action 4 |
| **Powerbank** | 1× | Kompakte Powerbank (im Code vordefiniert auf ca. 40 × 60 × 20 mm, flexibel anpassbar) |
| **Gewindeeinsätze (Base)** | 3× | M3 Einschmelzmuttern / Heat-Set Inserts (z. B. Ruthex M3 × 5,7 mm) |
| **Schrauben (Deckel)** | 3× | M3 Zylinderkopf- oder Innensechskantschrauben (Länge passend zum Deckel) |
| **Stativgewinde** | 1× | 1/4"-20 UNC Gewindeeinsatz / Einschmelzmutter für Kamerastative |
| **USB-Kabel** | 2× | Kurze USB-C auf USB-C Kabel (idealerweise mit 90°-Winkelsteckern) |

---

## 📂 Projekt- & Dateistruktur

```text
├── dgi_action_4_DualCam-Rig.scad   # Parametrisches OpenSCAD-Hauptmodell
├── 3mf Files/                      # Vorbereitete Slicer-Dateien (Bambu Studio / PrusaSlicer)
│   ├── base.3mf                    # Hauptgehäuse
│   ├── cover.3mf                   # Kompakter Standarddeckel
│   ├── cover_with_shield.3mf       # Deckel mit Regenschutz (Rain Shield)
│   └── emblem.3mf                  # Front-Trapez Emblem
└── README.md                       # Dokumentation
```

---

## 🖨️ 3D-Druck & Render-Modi

### OpenSCAD Render-Modi

Die STL-Generierung der Einzelteile erfolgt über die Variable `RENDER_MODE` im Quellcode ([`dgi_action_4_DualCam-Rig.scad`](./dgi_action_4_DualCam-Rig.scad)):

1. Parameter `RENDER_MODE` in der `.scad`-Datei auf das gewünschte Bauteil setzen.
2. <kbd>F6</kbd> drücken (Vollständiges Rendern).
3. <kbd>F7</kbd> drücken (Als STL exportieren).

| `RENDER_MODE` | Bauteil | Beschreibung |
| :--- | :--- | :--- |
| `"base"` | **Hauptgehäuse** | Rig-Basis mit Kameraschächten, Powerbank-Garage & Stativkragen |
| `"shield"` | **Rain Shield Deckel** | Regenschutz-Deckel (wird automatisch flach aufs Druckbett gelegt) |
| `"top"` | **Standard Deckel** | Flacher, kompakter Deckel ohne Überhang |
| `"emblem"` | **Front-Emblem** | Trapez-Insert für Front-Branding zum Einklicken oder Einkleben |

### Druckempfehlungen & Slicer-Einstellungen

Für maximale Robustheit und Witterungsbeständigkeit am Stativ empfiehlt sich kohlefaserverstärktes oder hitzebeständiges Filament wie **PETG-CF**, **PETG** oder **ASA/ABS**.

| Parameter | Empfohlener Wert | Details & Tipps |
| :--- | :--- | :--- |
| **Material** | **PETG-CF** / PETG / ASA | CF-Varianten bieten optimale Steifigkeit und ein sauberes mattes Finish |
| **Wandlinien (Walls)** | **4 – 5** | Wichtig für mechanische Stabilität und sicheren Halt der Einschmelzmuttern |
| **Infill** | **20% – 30% Gyroid** | Ausgezeichnete Stabilität bei gleichmäßigem Materialeinsatz |
| **Schichthöhe** | **0.16 – 0.20 mm** | 0.20 mm Standard liefert perfekte Ergebnisse |
| **Support (Base)** | **Normal / Tree Support** | Nötig für Kameraschächte und den Powerbank-Einschub |
| **Support (Shield/Top)** | **Keine** | Liegen flach auf dem Druckbett auf und drucken ohne Stützen |

---

## ⚙️ Parametrische Anpassung

Das Modell ist vollständig parametrisch aufgebaut. Alle Kernabmessungen können im oberen Bereich der [`dgi_action_4_DualCam-Rig.scad`](./dgi_action_4_DualCam-Rig.scad) individuell konfiguriert werden:

```openscad
// ==========================================
// PARAMETER & KONFIGURATION
// ==========================================

// Powerbank-Abmessungen (Einschubkammer)
pb_width        = 40.0;   // Breite der Powerbank in mm
pb_length       = 60.0;   // Länge/Tiefe der Powerbank in mm
pb_height       = 20.0;   // Höhe der Powerbank in mm

// Regenschutz
shield_overhang = 12.0;   // Überstand der Krempe (typisch 8.0 - 18.0 mm)

// Rig-Geometrie
rig_angle       = 80.0;   // Horizontaler Spreizwinkel zwischen den Kameras
cam_pitch       = 20.0;   // Neigungswinkel nach unten (Tilt)
```

---

## 🚀 Montageanleitung

```text
  [ Rain Shield / Top Cover ]
              │  (3× M3 Schrauben)
              ▼
  ┌─────────────────────────┐
  │ [Cam 1]  [PB]  [Cam 2]  │ ◄── Einschub Kameras & Powerbank
  │      [Main Base]        │
  └─────────────────────────┘
              ▲
              │  (1× 1/4" Stativadapter)
        [ 1/4" Tripod ]
```

1. **Einschmelzmuttern einsetzen:**
   - Die 3× M3-Gewindeeinsätze mit einer Lötkolbenspitze (ca. 220–250 °C) vorsichtig und gerade in die vorgesehenen Schraubtürme der Base einschmelzen.
2. **Stativgewinde montieren:**
   - Den 1/4"-Stativ-Gewindeeinsatz an der Unterseite der Base bündig einpressen bzw. einschrauben.
3. **Powerbank einschieben:**
   - Die Powerbank von hinten horizontal in den zentralen Schacht einschieben (das vordere Loch dient bei Bedarf als Auswerfer).
4. **Kameras & Verkabelung:**
   - Beide DJI Osmo Action 4 Kameras in ihre Halterungen einsetzen.
   - Kurze USB-C-Kabel von der Powerbank durch die integrierten Kanäle zu den Ladebuchsen der Kameras verlegen.
5. **Deckel verschrauben:**
   - *Rain Shield* oder *Top Cover* aufsetzen und mit den 3× M3-Schrauben handfest fixieren. Die Schraubenköpfe versenken sich bündig in den dafür vorgesehenen Vertiefungen.
