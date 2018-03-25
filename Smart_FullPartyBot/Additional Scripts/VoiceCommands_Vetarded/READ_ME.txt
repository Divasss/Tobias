In order to use:

	1.	Start the script on all characters that should be following commands.
	2. 	To send a command to your party, write in the in-game chat, either in Party chat, General Chat, or PM
		- the script will only respond to commands that are sent from a party member.
		- all commands must have the prefix 'c'. (see list of commands)


Example of a command:
	
	Command:	"c port giran"
	What it does	all listeners will write ".giran" in the chat.

	In order for it to work, the ingame chat must be set to "All" chat.
	
	WARNING:
	when ".giran" is written to the chat, the 'ENTER' button will be pressed twice,
	so avoid pressing the 'ALT' button, while the commands are being executed.
	
	if however the 'ALT' button is pressed, every bot window that is executing the command will jump to full screen mode -> huge lag/mess.




List of commands:
	
	"c port giran"
	"c port dion"
	"c port gludio"
	"c port schuttgart"
	... (for all 10 towns)	

	"c to village"
	"c to clan hall"
	"c to castle"
	"c to fort"
	"c to outpost"
	... (If the bots are dead, they will press To Village/To Clan Hall etc...)

	"c soe to castle"
	... (Use scroll of escape to castle, if we have one in inventory)

	"c talk x y z"			(Where x y z are numbers)

The "talk" command:
	for example:	"c talk 1 3"
	this will:
		Take target of the person who spoke the command
		Walk close
		Open the dialog
		Press 1st dialog option
		Press 3rd dialog option


	the amount of numbers may vary.
	So the following examples are all valid commands.

	"c talk 1 2 1 1 4 1 1"
	"c talk 1"
	"c talk 3 6"
	

	For example: 
		if you have targetted the Global gatekepper, 
		and you wish to port your party to AQ nest, 
		then type "c talk 6 17"
	