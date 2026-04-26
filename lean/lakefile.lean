import Lake
open Lake DSL

package prysm where
  leanOptions := #[
    ⟨`autoImplicit, false⟩
  ]

@[default_target]
lean_lib Prysm where
  roots := #[`Prysm.Layout.Protocol, `Prysm.Layout.Sizing,
             `Prysm.Layout.Container, `Prysm.Layout.Fold,
             `Prysm.Layout.Gravity, `Prysm.Layout.Multimodal,
             `Prysm.Layout.Algebra]
