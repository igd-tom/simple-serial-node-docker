const SerialPort = require("serialport");

SerialPort.list()
  .then((res) => {
    res.forEach((serial) => {
      if (serial.path.includes("ttyUSB")) {
        console.log(serial);
      }
    });
  })
  .catch((e) => console.log("error: ", e));
