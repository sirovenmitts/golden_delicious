# GoldenDelicious
## Tasty info about an Apple serial number

Apple tries really hard to make it impossible to know anything about a serial number. Additionally, Apple uses about 5 different ways to identify a computer. This gem aims to make things a little easier.

NOTE: Every time you use this gem you make at least 2 HTTP requests.

## Usage

### I only want information about a serial number

Well then, just do this:

    serial_number = GoldenDelicious::SerialNumber.new SERIAL_NUMBER

You'll get back an object with the following information:

<<<<<<< HEAD
<table>
	<tr>
		<td>
			serial_number.location
		</td>
		<td>
			The code for the plant this computer was manufactured at.
		</td>
	</tr>
	<tr>
		<td>
			serial_number.year
		</td>
		<td>
			A code indicating what year this computer was manufactured.
		</td>
	</tr>
	<tr>
		<td>
			serial_number.week
		</td>
		<td>
			The week this computer was manufactured.
		</td>
	</tr>
	<tr>
		<td>
			serial_number.id
		</td>
		<td>
			The unique identifier for this computer.
		</td>
	</tr>
	<tr>
		<td>
			serial_number.mode
		</td>
		<td>
			The computer's model identifier (e.g. Z5W or 1AX).
		</td>
	</tr>
</table>
### I really only care about the computer's model

If you already know the model identifier then just do this:

    model = GoldenDelicious::Model.new MODEL_IDENTIFIER

You'll get an object with the following information:
<table>
	<tr>
		<td>
			model.memory 
		</td>
		<td>
			Information about the RAM that this computer uses.
		</td>
	</tr>
	<tr>
		<td>
			model.storage 
		</td>
		<td>
			Information about the hard drive in this computer.
		</td>
	</tr>
	<tr>
		<td>
			model.identifiers
		</td>
		<td>
			Most of the identifiers Apple uses for this model.
		</td>
	</tr>
</table>

Please see lib/golden_delicious/model.rb for more information - it's really simple, though quite ugly.

If you DON'T know the model identifier but you have a serial number:

=======
serial_number.location 	| The code for the plant this computer was manufactured at.
serial_number.year 		| A code indicating what year this computer was manufactured.
serial_number.week 		| The week this computer was manufactured.
serial_number.id 		| The unique identifier for this computer.
serial_number.model 	| The computer's model identifier (e.g. Z5W or 1AX).

### I really only care about the computer's model

If you already know the model identifier then just do this:

    model = GoldenDelicious::Model.new MODEL_IDENTIFIER

You'll get an object with the following information:

model.memory 		| Information about the RAM that this computer uses.
model.storage 		| Information about the hard drive in this computer.
model.identifiers 	| Most of the identifiers Apple uses for this model.

Please see lib/golden_delicious/model.rb for more information - it's really simple, though quite ugly.

If you DON'T know the model identifier but you have a serial number:

>>>>>>> a2f51364ce2742739cffb641b3976b3179eea59c
    device = GoldenDelicious::Device.new SERIAL_NUMBER

This object has all of the information that SerialNumber AND Model have! It's awesome!

## Help?

This is just a gem I need for work projects, but if you want to help me, please feel free. Right now my tests woefully brittle: I don't have any serial numbers to test edge cases (older computers, iPhones, iPods, etc.). Please feel free to send me your serial number; I won't do anything weird with it - just put it in some tests to ensure that this gem does what it's supposed to.