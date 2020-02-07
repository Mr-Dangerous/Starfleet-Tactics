/**
@desc **System Callback**
      This is called when a response has been receieved from a sent Connection Request 
	  
* FRAMEWORK NOTE: *This is CALLED FROM Connection -> USER EVENT 3*
*/
///@param {Enum} ConnectionAddResult The add result receieved
///@param {Number} ConnectionId The connectionId that sent the message
var _connectionResult = argument0;
var _connectionId     = argument1;

// Your code here. 

switch (_connectionResult)
{
	case ConnectionAddResult.AlreadyConnected:
		// Code Here. For some reason this connection is already connected to the attempted connection
	break;
	case ConnectionAddResult.MaxPlayer:
		// Code Here. You got a response that the address you tried to connect to is full.
	break;
	case ConnectionAddResult.Success:
		// Code Here. Your connection was successfull. _connectionId is populated with an id! Save it or something
	break;
}

