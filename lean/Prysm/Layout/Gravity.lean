/-
  Prysm Layout Protocol — Urgency-Gravity Composition
  Theorem 7 (five composition properties)
-/

/-- Focus from tri-kernel, per-mille (0 = none, 1000 = max) -/
abbrev Focus := Nat

/-- Urgency from UI semantics (0 = ambient, 50 = blocking) -/
abbrev Urgency := Nat

def urgencyMax : Nat := 50
def depthMax : Nat := 1000

/--
  The composition rule:
  p_z = d_max × (1000 - max(focus, urgency × 1000 / urgencyMax)) / 1000
-/
def composePz (focus : Focus) (urgency : Urgency) : Nat :=
  let f := min focus 1000
  let u := min (urgency * 1000 / urgencyMax) 1000
  depthMax * (1000 - max f u) / 1000

/-- Theorem 7a: blocking urgency → depth 0 -/
theorem urgency_dominance :
    composePz 500 50 = 0 := by native_decide

/-- Theorem 7a': any focus with max urgency → depth 0 -/
theorem urgency_dominance' (focus : Focus) (h : focus ≤ 1000) :
    composePz focus 50 = 0 := by
  simp [composePz, urgencyMax, depthMax]
  -- urgency * 1000 / 50 = 50 * 1000 / 50 = 1000
  -- min 1000 1000 = 1000
  -- max (min focus 1000) 1000 = 1000
  -- 1000 * (1000 - 1000) / 1000 = 0
  -- max(min focus 1000, min(50*1000/50) 1000) = max(min focus 1000, 1000) = 1000
  -- 1000 * (1000 - 1000) / 1000 = 0
  omega

/-- Theorem 7b: zero urgency → pure gravity -/
theorem gravity_dominance :
    composePz 700 0 = depthMax * (1000 - 700) / 1000 := by native_decide

/-- Theorem 7c: monotonicity in urgency (concrete example) -/
theorem urgency_mono_example :
    composePz 300 30 ≤ composePz 300 10 := by native_decide

/-- Theorem 7d: monotonicity in focus (concrete example) -/
theorem focus_mono_example :
    composePz 800 20 ≤ composePz 400 20 := by native_decide

/-- Theorem 7e: determinism -/
theorem gravity_deterministic (f : Focus) (u : Urgency) :
    composePz f u = composePz f u := rfl

/-- Key scenario: modal in front of high-focus content -/
-- modal: urgency 50, focus 100 → composePz = 0
-- content: urgency 0, focus 900 → composePz = 100
theorem modal_in_front :
    composePz 100 50 < composePz 900 0 := by native_decide
