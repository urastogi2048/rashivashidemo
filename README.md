# 🔮 RashiVashi – Animated Tarot Card Reveal

A Flutter implementation of an animated tarot card experience, focusing on polished interactions, smooth motion, and clean animation architecture.

## Features

* Interactive 3D tarot card flip using `AnimationController` and `Matrix4` transforms
* Divine golden reveal glow after the card is flipped
* Subtle idle floating animation while the card is face-down
* Draw a random tarot card from a set of five unique cards
* Animated card transition when drawing a new card
* Custom starfield background for an immersive mystical atmosphere
* Lottie animations integrated into each tarot card

---

## Running the Project

### Prerequisites

* Flutter SDK (latest stable)
* Dart SDK
* Android Studio / VS Code
* An Android emulator or physical device

### Installation

```bash
git clone <repository-url>
cd rashivashi_app
flutter pub get
flutter run
```

---

## Packages Used

### lottie

Used to integrate animated tarot illustrations and enhance the visual experience with lightweight vector animations.

**Reason:**
Lottie provides smooth, scalable animations without requiring frame-by-frame asset rendering, making it ideal for expressive UI elements.

---

## Native Flutter Animations

The project intentionally combines native Flutter animations with Lottie.

Native Flutter animations include:

* Explicit `AnimationController`-driven 3D card flip
* `Matrix4` perspective transformation
* Golden reveal glow animation
* Idle floating animation for the face-down card
* Animated card transitions during random draws

This approach provides precise control over interaction timing while using Lottie to enrich the overall visual experience.

---

## Design Decisions

* Used explicit animations instead of relying solely on implicit widgets to have full control over animation timing and sequencing.
* Kept animation responsibilities separated (flip, glow, idle, and draw transition) to make the code easier to understand and extend.
* Focused on subtle motion rather than exaggerated effects to create a premium tarot experience.

---

## What I'd Improve With More Time

* Add a realistic deck shuffle animation before drawing a new card.
* Introduce particle effects synchronized with the reveal animation.
* Replace placeholder tarot data with complete Major Arcana artwork and descriptions.
* Add haptic feedback and sound effects for a more immersive interaction.
* Improve accessibility by supporting reduced-motion preferences.
* Further refine the card transition to simulate a physical deck draw.

---

## Tech Stack

* Flutter
* Dart
* Lottie

---

Thank you for reviewing my submission!
