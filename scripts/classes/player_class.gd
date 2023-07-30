class_name Player_Class
var id: int
var name: String
var colour: Color

## WITH THE NEW DICTIONARY IMPLEMENTATION OF THE PLAYER DATA THIS CLASS MAY BECOME IRRELEVANT
## SINCE IT WAS STILL USED AS A PARAMER FOR SOME FUNCTIONS,
## I'VE OVERLOADED THE CONSTRUCTOR HERE SO YOU CAN CREATE A PLAYER_CLASS INSTANCE FROM A DICTIONARY
func _init(player_data: Dictionary):
	id = player_data.id
	name = player_data.name
	colour = player_data.colour
