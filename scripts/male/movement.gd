class_name CharacterMovement

static func handle_movement(body: CharacterBody2D, delta: float, speed: float = 150.0) -> void:
    var direction := Input.get_axis("move_left", "move_right")

    if direction != 0:
        body.velocity.x = direction * speed
    else:
        body.velocity.x = move_toward(body.velocity.x, 0, delta * speed * 2)

    body.move_and_slide()

static func update_animations(body: CharacterBody2D, sprites: Array[AnimatedSprite2D]) -> void:
    if sprites.is_empty():
        return

    var target_anim: StringName = "idle"

    if body.velocity.x != 0:
        target_anim = "walk"
    else:
        target_anim = "idle"

    if body.velocity.x != 0:
        var is_flipped := body.velocity.x < 0

        for sprite in sprites:
            sprite.flip_h = !is_flipped

    AnimationUtils.play_synced(sprites, target_anim)
