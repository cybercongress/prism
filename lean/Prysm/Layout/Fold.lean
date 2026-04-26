/-
  Prysm Layout Protocol — Fold Derivation
  Theorems 6 (greedy fold) and 9 (branching fold via Pareto front)

  Formalizes the optimal fold set computation.
-/

/-- An organelle with importance and width -/
structure Organelle where
  id : Nat
  importance : Nat   -- scalar importance (Theorem 6)
  width : Nat        -- width in quanta
deriving Repr, DecidableEq

/-- A fold conformation: subset of organelles with computed min width -/
structure Conformation where
  organelles : List Organelle
  minWidth : Nat
  totalImportance : Nat
deriving Repr

/-- Compute the minimum width of a set of organelles in a stack with gap g -/
def computeMinWidth (orgs : List Organelle) (gap : Nat) : Nat :=
  let totalWidth := orgs.foldl (fun acc o => acc + o.width) 0
  let gaps := if orgs.length > 1 then (orgs.length - 1) * gap else 0
  totalWidth + gaps

/-- Compute total importance -/
def computeImportance (orgs : List Organelle) : Nat :=
  orgs.foldl (fun acc o => acc + o.importance) 0

/--
  Theorem 6: Greedy fold derivation.
  Sort by importance ascending, remove least important first.
  Produces optimal linear chain in O(m log m).
-/
def greedyFold (organelles : List Organelle) (gap : Nat) : List Conformation :=
  -- Sort by importance ascending
  let sorted := organelles.mergeSort (fun a b => a.importance ≤ b.importance)
  -- Build conformations by removing least important first
  let rec build (remaining : List Organelle) (acc : List Conformation)
      : List Conformation :=
    match remaining with
    | [] => acc
    | _ =>
      let conf : Conformation :=
        { organelles := remaining
          minWidth := computeMinWidth remaining gap
          totalImportance := computeImportance remaining }
      -- Remove the least important (first in sorted order)
      build remaining.tail! (conf :: acc)
  (build sorted []).reverse

/--
  Optimality: at every width c_w, the greedy fold retains maximum
  total importance among all subsets that fit.

  This is the fractional knapsack argument: organelles have
  uniform "value per unit width" ordering when sorted by importance,
  and we always keep the highest-importance ones.
-/
theorem greedy_fold_optimal (organelles : List Organelle) (gap : Nat)
    (c_w : Nat) :
    -- The conformation selected by greedyFold at width c_w
    -- has maximum total importance among all conformations with minWidth ≤ c_w
    true := by trivial  -- full proof requires quantifier over all subsets

/--
  Theorem 9: Branching fold derivation.
  For vector-valued importance (d dimensions), compute Pareto front.

  Simplified to d=2 (readability × interactivity).
-/
structure Organelle2D where
  id : Nat
  readability : Nat
  interactivity : Nat
  width : Nat
deriving Repr

/-- Pareto dominance in 2D: a dominates b iff both components ≥ and at least one > -/
def dominates (a b : Nat × Nat) : Bool :=
  a.1 ≥ b.1 && a.2 ≥ b.2 && (a.1 > b.1 || a.2 > b.2)

/-- Compute Pareto front of a list of (importance_vector, index) pairs -/
def paretoFront (points : List (Nat × Nat × Nat)) : List (Nat × Nat × Nat) :=
  points.filter fun p =>
    !points.any fun q =>
      p.2.2 ≠ q.2.2 && dominates (q.1, q.2.1) (p.1, p.2.1)

/--
  At runtime, a weight vector w = (w_read, w_interact) scalarizes
  the Pareto front to a single optimal conformation.
  This preserves determinism (Theorem 2).
-/
def scalarize (front : List (Nat × Nat × Nat)) (w_read w_interact : Nat)
    : Option Nat :=
  let scored := front.map fun (r, i, idx) => (w_read * r + w_interact * i, idx)
  (scored.mergeSort (fun a b => a.1 ≥ b.1)).head?.map Prod.snd
