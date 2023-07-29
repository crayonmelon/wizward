extends RigidBody3D

const rolling_force = 20

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _enter_tree():
	set_multiplayer_authority(str(name).to_int())

func _ready():
	if not is_multiplayer_authority(): return
		

func _physics_process(delta):
	if not is_multiplayer_authority(): return
	
	if Input.is_action_pressed("UP"):
		angular_velocity.x -= rolling_force*delta
	elif Input.is_action_pressed("DOWN"):
		angular_velocity.x += rolling_force*delta
		
	if Input.is_action_pressed("LEFT"):
		angular_velocity.z += rolling_force*delta
	elif Input.is_action_pressed("RIGHT"):
		angular_velocity.z -= rolling_force*delta
		
	print(angular_velocity)
