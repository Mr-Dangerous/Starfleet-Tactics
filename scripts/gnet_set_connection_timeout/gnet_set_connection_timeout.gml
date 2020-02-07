///@desc Set the time in seconds that it takes for the OnConnectionProblem script to trigger. This will trigger if data hasnt been received in this givin amount of time from a specific connection
///@param {Number} Seconds Amount of time with no data sent before OnConnectionProblem(connectionId) is triggered.

NetworkManager.connectionTimeoutTime = 1000 * argument0;