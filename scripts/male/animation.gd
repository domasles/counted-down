class_name AnimationUtils

static func play_synced(sprites: Array[AnimatedSprite2D], anim_name: StringName) -> void:
    if sprites.is_empty():
        return

    var leader: AnimatedSprite2D = sprites[0]

    for sprite in sprites:
        sprite.play(anim_name)

    for i in range(1, sprites.size()):
        sprites[i].set_frame_and_progress(leader.frame, leader.frame_progress)
