# Resume Builder Pro — Full Implementation Plan

## Overview

Build a production-ready Flutter application called **ResumEase** (brand name from design) / **Resume Builder Pro** based on 13 design screens provided. The app uses Clean Architecture with Riverpod, GoRouter, Hive, and produces PDF resumes.

## Design System Extracted from Images & DESIGN.md

### Colors (Zenith Interface palette)
| Token | Hex | Usage |
|---|---|---|
| `primary` | `#3525CD` | Brand indigo, CTAs, active nav |
| `primaryContainer` | `#4F46E5` | Buttons, filled chips, AI badges |
| `secondary` | `#4648D4` | Secondary actions |
| `secondaryContainer` | `#6063EE` | User chat bubbles, progress cards |
| `surface` | `#FCF8FF` | App background |
| `surfaceContainerLowest` | `#FFFFFF` | Card backgrounds |
| `surfaceContainer` | `#F0ECF9` | Subtle containers |
| `surfaceVariant` | `#E4E1EE` | Skeleton lines, chips |
| `onSurface` | `#1B1B24` | Primary text |
| `onSurfaceVariant` | `#464555` | Secondary text |
| `outline` | `#777587` | Borders |
| `outlineVariant` | `#C7C4D8` | Subtle borders |
| `error` | `#BA1A1A` | Error states |
| `tertiary` | `#7E3000` | Accent orange |
| `tertiaryContainer` | `#A44100` | PDF badge |

### Typography (Inter font exclusively)
| Style | Size | Weight | Line Height | Letter Spacing |
|---|---|---|---|---|
| Display | 32px | 700 | 40px | -0.02em |
| Headline Large | 24px | 600 | 32px | -0.015em |
| Headline Medium | 20px | 600 | 28px | -0.01em |
| Body Large | 16px | 400 | 24px | — |
| Body Medium | 14px | 400 | 20px | — |
| Label Medium | 12px | 500 | 16px | — |
| Label Small | 11px | 600 | 14px | — |

### Spacing (8pt grid)
| Token | Value |
|---|---|
| xs | 4px |
| sm | 8px |
| md | 16px |
| lg | 24px |
| xl | 32px |
| Container Padding | 20px |
| Gutter | 12px |

### Border Radius
| Token | Value |
|---|---|
| sm | 4px |
| DEFAULT | 8px |
| md | 12px |
| lg | 16px |
| xl | 24px |
| full | 9999px (pill) |

### Elevation
- Cards: `BoxShadow(0, 4, 20, rgba(0,0,0,0.05))`
- Glassmorphic nav: 20px backdrop blur, 70% white opacity
- Interactive: indigo-tinted shadow

---

## 13 Screens to Implement

1. **Splash Screen** — Logo + floating resume mockup + tagline + dots
2. **Onboarding: AI Writing** — AI suggestion cards + chat bubble style + "Next" CTA
3. **Onboarding: ATS Templates** — Progress bar + resume preview + feature chips + "Next Step"
4. **Onboarding: Instant Export** — PDF/share illustration + "Get Started" CTA
5. **Sign In / Sign Up** — Tab toggle + email/password fields + Google login + guest mode
6. **Home Dashboard** — Greeting + search + goal card + recent resumes + bottom nav
7. **Resume Editor** — Strength meter + expandable sections (Personal Info, Summary, Experience, Skills) + drag handles + Preview/Save buttons
8. **Resume Templates** — Search + category chips + 2-column grid of template cards with PREMIUM/ATS badges
9. **Resume Preview** — Full resume render + dark mode toggle + "Download PDF" + share + switch template carousel
10. **User Profile & Subscription** — Avatar + Pro badge + subscription card + Account Management list
11. **ATS Optimization Score** — Circular score gauge + readability/keyword chips + missing keywords list + formatting insights cards + AI optimizer CTA
12. **AI Career Assistant** — Chat interface with AI/user bubbles + quick action chips + message input
13. **Settings** (from profile screen — Saved Resumes, Settings link)

---

## Proposed Architecture

### Folder Structure
```
lib/
├── core/
│   ├── config/
│   │   └── app_config.dart
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_spacing.dart
│   │   ├── app_typography.dart
│   │   ├── app_radius.dart
│   │   ├── app_shadows.dart
│   │   └── app_strings.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── dark_theme.dart
│   ├── utils/
│   │   ├── extensions.dart
│   │   ├── validators.dart
│   │   └── helpers.dart
│   ├── services/
│   │   ├── hive_service.dart
│   │   ├── pdf_service.dart
│   │   └── auth_service.dart
│   └── widgets/
│       ├── app_button.dart
│       ├── app_text_field.dart
│       ├── app_card.dart
│       ├── app_chip.dart
│       ├── bottom_nav_bar.dart
│       ├── app_bar_widget.dart
│       ├── circular_progress_indicator.dart
│       └── section_header.dart
├── features/
│   ├── splash/
│   │   └── presentation/
│   │       └── screens/
│   │           └── splash_screen.dart
│   ├── onboarding/
│   │   └── presentation/
│   │       └── screens/
│   │           ├── onboarding_screen.dart
│   │           ├── onboarding_ai_page.dart
│   │           ├── onboarding_ats_page.dart
│   │           └── onboarding_export_page.dart
│   ├── authentication/
│   │   ├── domain/
│   │   │   └── auth_repository.dart
│   │   ├── data/
│   │   │   └── auth_repository_impl.dart
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── auth_provider.dart
│   │       ├── screens/
│   │       │   └── login_screen.dart
│   │       └── widgets/
│   │           └── auth_form.dart
│   ├── home/
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── home_provider.dart
│   │       ├── screens/
│   │       │   └── home_screen.dart
│   │       └── widgets/
│   │           ├── goal_card.dart
│   │           ├── resume_card.dart
│   │           └── search_bar_widget.dart
│   ├── resume/
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   │   └── resume_model.dart
│   │   │   └── repositories/
│   │   │       └── resume_repository.dart
│   │   ├── data/
│   │   │   └── resume_repository_impl.dart
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── resume_provider.dart
│   │       ├── screens/
│   │       │   ├── resume_editor_screen.dart
│   │       │   └── resume_preview_screen.dart
│   │       └── widgets/
│   │           ├── section_card.dart
│   │           ├── strength_meter.dart
│   │           ├── personal_info_section.dart
│   │           ├── summary_section.dart
│   │           ├── experience_section.dart
│   │           ├── education_section.dart
│   │           ├── skills_section.dart
│   │           └── ai_improve_button.dart
│   ├── templates/
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── templates_provider.dart
│   │       ├── screens/
│   │       │   └── templates_screen.dart
│   │       └── widgets/
│   │           ├── template_card.dart
│   │           └── category_chips.dart
│   ├── ai_assistant/
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── ai_provider.dart
│   │       ├── screens/
│   │       │   └── ai_assistant_screen.dart
│   │       └── widgets/
│   │           ├── chat_bubble.dart
│   │           └── quick_action_chips.dart
│   ├── ats_score/
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── ats_provider.dart
│   │       ├── screens/
│   │       │   └── ats_score_screen.dart
│   │       └── widgets/
│   │           ├── score_gauge.dart
│   │           ├── keyword_card.dart
│   │           └── insight_card.dart
│   ├── profile/
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── profile_provider.dart
│   │       ├── screens/
│   │       │   └── profile_screen.dart
│   │       └── widgets/
│   │           └── subscription_card.dart
│   └── settings/
│       └── presentation/
│           ├── providers/
│           │   └── settings_provider.dart
│           └── screens/
│               └── settings_screen.dart
├── routes/
│   └── app_router.dart
└── main.dart
```

---

## Step-by-Step Execution Plan

### Step 1 — Project Setup & Design System *(this step)*
- Create Flutter project
- Install all dependencies
- Create folder structure
- Implement design tokens (colors, typography, spacing, radius, shadows)
- Create `AppTheme` (light + dark)
- Create `memory.md`

### Step 2 — Project Skeleton & Core Services
- Configure Hive database service
- Set up Riverpod ProviderScope
- Set up GoRouter with all routes
- Create resume data model

### Step 3 — Reusable Widgets
- AppButton (primary, secondary, outline, Google)
- AppTextField (with icon prefix/suffix)
- AppCard (resume cards, setting tiles)
- AppChip (filled, outline, with badge)
- BottomNavBar (glassmorphic, 5 tabs)
- AppBarWidget (avatar + brand + notification bell)
- CircularProgressWidget (for score/strength)
- SectionHeader (title + trailing action)

### Step 4 — Navigation & Shell
- GoRouter shell route with bottom nav
- Route transitions with animations
- Deep linking support

### Step 5 — Splash Screen
- Logo with rotation animation
- Floating resume mockup card
- Tagline + pulsing dots
- Auto-navigate after delay

### Step 6 — Onboarding (3 pages)
- PageView with dot indicator
- AI Writing page
- ATS Templates page
- Instant Export page
- Skip + Next + Get Started CTAs

### Step 7 — Authentication
- Login/Sign Up tab toggle
- Email + Password fields
- Remember me + Forgot password
- Sign In button
- Google sign-in
- Continue as Guest
- Terms & Privacy footer

### Step 8 — Home Dashboard
- Greeting header with avatar
- Search bar
- Goal progress card (indigo gradient)
- Continue Editing section with resume card
- Recent Resumes grid
- FAB for new resume

### Step 9 — Resume Editor
- Resume strength meter (circular + linear)
- Expandable section cards (Personal Info, Summary, Experience, Skills)
- Drag handles for reordering
- AI Improve button
- Preview + Save Draft buttons

### Step 10 — Resume Templates
- Search bar
- Category filter chips (All, Modern, Executive, Creative...)
- 2-column grid of template cards
- PREMIUM / ATS FRIENDLY badges
- Heart/favorite toggle
- AI Resume Analyzer banner

### Step 11 — Resume Preview & PDF
- Full resume rendered in scrollable card
- Dark mode toggle
- Share FAB
- Download PDF button
- Switch Template carousel
- PDF generation with `pdf` package

### Step 12 — Profile & Subscription
- Profile photo with PREMIUM badge
- Name + title
- Go Pro card with upgrade CTA
- Account & Management list (Saved Resumes, Settings)
- Billing History

### Step 13 — ATS Optimization Score
- Circular score gauge (85/100)
- Readability + Keyword Match chips
- Missing Keywords list with +Add buttons
- Formatting Insights cards
- AI Optimizer CTA

### Step 14 — AI Career Assistant
- Chat interface with message bubbles
- AI avatar + user avatar
- Quick action chips (Improve Summary, Rewrite Experience)
- Message input with send button
- "Active Now" status

### Step 15 — Settings, Animations & Polish
- Dark/Light mode toggle
- Language, Notifications, Backup, Restore, Privacy, Terms, About
- flutter_animate for all transitions
- Hero animations
- Final optimization

---

## Packages Required

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.5.1
  go_router: ^14.2.0
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  google_fonts: ^6.2.1
  flutter_animate: ^4.5.0
  cached_network_image: ^3.3.1
  pdf: ^3.11.0
  printing: ^5.13.1
  uuid: ^4.4.2
  image_picker: ^1.1.2
  path_provider: ^2.1.3
  share_plus: ^9.0.0
  url_launcher: ^6.3.0
  flutter_svg: ^2.0.10+1
  intl: ^0.19.0
  reorderables: ^0.7.12

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  hive_generator: ^2.0.1
  build_runner: ^2.4.9
```

---

## Verification Plan

### Build Tests
- `flutter analyze` must pass with no errors
- `flutter build apk --debug` must succeed
- `flutter build web` must succeed

### Screen Verification
- Each screen compiles and renders matching the design image
- Navigation flows correctly between all screens
- Bottom nav works with proper active states

### Feature Verification
- Resume CRUD operations work with Hive
- PDF generation produces proper output
- Auth flow (guest mode) works end-to-end
- Template switching works
- ATS score screen renders correctly

> [!IMPORTANT]
> This is a very large project with 13+ screens. I'll build it step-by-step, starting with Step 1 (project setup, design system, folder structure, theme, memory.md). Each step will produce compilable code. Shall I proceed?
