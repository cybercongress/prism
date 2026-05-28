use bevy::prelude::*;
use crate::theme;
use crate::atoms::glass::{GlassDepth, glass_bg, saber_h};

#[derive(Component)]
pub struct ButtonPrysm;

pub fn spawn_button(parent: &mut ChildSpawnerCommands, label: &str) -> Entity {
    parent
        .spawn((
            ButtonPrysm,
            Button,
            Node {
                flex_direction: FlexDirection::Column,
                align_items: AlignItems::Center,
                padding: UiRect::axes(Val::Px(theme::G * 2.0), Val::Px(theme::G)),
                ..default()
            },
            glass_bg(GlassDepth::Midground),
        ))
        .with_children(|b| {
            saber_h(b);
            b.spawn((
                Text::new(label),
                TextFont { font_size: theme::BODY, ..default() },
                TextColor(theme::TEXT_PRIMARY),
            ));
            saber_h(b);
        })
        .id()
}
