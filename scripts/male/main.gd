extends CharacterBody2D

@onready var body: AnimatedSprite2D = $Body
@onready var hair: AnimatedSprite2D = $Hair
@onready var top: AnimatedSprite2D = $Top
@onready var bottom: AnimatedSprite2D = $Bottom
@onready var feet: AnimatedSprite2D = $Feet

@onready var sprites: Array[AnimatedSprite2D] = [body, hair, top, bottom, feet]

const SPEED = 45.0
const JUMP_VELOCITY = -300.0

func play_anim(anim_name: StringName) -> void:
    AnimationUtils.play_synced(sprites, anim_name)

func _physics_process(delta: float) -> void:
    CharacterMovement.handle_movement(self, delta, SPEED)
    CharacterMovement.update_animations(self, sprites)
