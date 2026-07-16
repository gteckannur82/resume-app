---
name: Zenith Interface
colors:
  surface: '#fcf8ff'
  surface-dim: '#dcd8e5'
  surface-bright: '#fcf8ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f5f2ff'
  surface-container: '#f0ecf9'
  surface-container-high: '#eae6f4'
  surface-container-highest: '#e4e1ee'
  on-surface: '#1b1b24'
  on-surface-variant: '#464555'
  inverse-surface: '#302f39'
  inverse-on-surface: '#f3effc'
  outline: '#777587'
  outline-variant: '#c7c4d8'
  surface-tint: '#4d44e3'
  primary: '#3525cd'
  on-primary: '#ffffff'
  primary-container: '#4f46e5'
  on-primary-container: '#dad7ff'
  inverse-primary: '#c3c0ff'
  secondary: '#4648d4'
  on-secondary: '#ffffff'
  secondary-container: '#6063ee'
  on-secondary-container: '#fffbff'
  tertiary: '#7e3000'
  on-tertiary: '#ffffff'
  tertiary-container: '#a44100'
  on-tertiary-container: '#ffd2be'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#e2dfff'
  primary-fixed-dim: '#c3c0ff'
  on-primary-fixed: '#0f0069'
  on-primary-fixed-variant: '#3323cc'
  secondary-fixed: '#e1e0ff'
  secondary-fixed-dim: '#c0c1ff'
  on-secondary-fixed: '#07006c'
  on-secondary-fixed-variant: '#2f2ebe'
  tertiary-fixed: '#ffdbcc'
  tertiary-fixed-dim: '#ffb695'
  on-tertiary-fixed: '#351000'
  on-tertiary-fixed-variant: '#7b2f00'
  background: '#fcf8ff'
  on-background: '#1b1b24'
  surface-variant: '#e4e1ee'
typography:
  display:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
    letterSpacing: -0.015em
  headline-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.01em
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 14px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  unit: 8px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  container-padding: 20px
  gutter: 12px
---

## Brand & Style
The brand personality is sophisticated, efficient, and empowering, designed to instill confidence in professionals during their career transitions. The design system follows a **Modern SaaS Minimalism** aesthetic, drawing inspiration from high-end productivity tools like Linear and Stripe.

The visual language is defined by high-quality whitespace, precision-engineered typography, and a subtle sense of depth. It avoids unnecessary decoration, focusing instead on content hierarchy and smooth interactions. The emotional response should be one of "effortless organization"—making the complex task of resume building feel structured and premium.

## Colors
The palette is rooted in a "Clean Tech" ethos. 
- **Primary & Secondary:** A duo of Indigos provides a vibrant, professional energy used for key actions and progress indicators.
- **Neutrals:** The background utilizes a cool slate-tinted white (#F8FAFC) to reduce eye strain and differentiate from the pure white (#FFFFFF) surface cards.
- **Functional:** Borders are kept extremely light to maintain the minimal aesthetic, while Success green is reserved for "CV Exported" or "Section Complete" states.

## Typography
Inter is used exclusively for its exceptional legibility and neutral, systematic feel. 
- **Scale:** A tight typographic scale ensures clarity on mobile screens. 
- **Hierarchy:** We use semi-bold and bold weights for headlines to create immediate visual anchors. 
- **Tracking:** Negative letter-spacing is applied to larger display type to achieve that characteristic SaaS "tightness," while body text remains at default tracking for maximum readability.

## Layout & Spacing
This design system utilizes an **8pt Spacing Grid** to maintain mathematical harmony. 
- **Mobile Layout:** A fluid grid with a fixed 20px horizontal margin. 
- **Rhythm:** Vertical spacing between unrelated sections should use `xl` (32px), while related elements within a card use `sm` (8px) or `md` (16px).
- **Safe Areas:** Design must strictly respect the top status bar and bottom home indicator areas, using these gaps to frame the content as if it’s floating.

## Elevation & Depth
Depth is created through **Soft Ambient Shadows** and **Tonal Layering** rather than heavy borders.
- **Base Level:** Background (#F8FAFC).
- **Surface Level:** White cards (#FFFFFF) with a `0px 4px 20px 0px rgba(0, 0, 0, 0.05)` shadow.
- **Interactive Level:** Active states or floating buttons use a more pronounced shadow with a slight indigo tint to suggest "pressability."
- **Glassmorphism:** Bottom navigation bars and top headers should use a 20px backdrop blur with a 70% white opacity to maintain context of the content scrolling beneath them.

## Shapes
The shape language is modern and approachable. 
- **Standard Cards:** Use a 16px radius (Rounded).
- **Main Containers:** Use a 20px radius for high-level screen segments.
- **Inputs & Buttons:** Use an 8px or 12px radius to maintain a distinction between "structural" elements and "interactive" elements.
- **Iconography:** Lucide-style icons with a 1.5pt stroke weight and slightly rounded caps to match the UI's softness.

## Components
- **Primary Button:** Solid #4F46E5 background, white text, 12px radius. High-sitting shadow to appear tactile.
- **Secondary Button:** White background with a subtle #E5E7EB border. No shadow.
- **Input Fields:** Minimalist design with a 1px border. On focus, the border transitions to #4F46E5 with a 4px soft outer glow (indigo-tinted).
- **Resume Cards:** Large 16px white cards featuring a progress ring (Success green) and a "last edited" timestamp in Text Secondary.
- **Chips/Badges:** Small, 100px (pill) radius badges with a 10% opacity primary color background and 100% opacity primary color text for skills and tags.
- **Bottom Navigation:** A glassmorphic bar with a soft top-border blur. Icons use a thin 1.5px stroke, with the active state indicated by a primary color shift and a subtle dot below the icon.
- **Section Headers:** Clean typography with a trailing "Edit" link in Primary Indigo.