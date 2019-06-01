# GoLang HTTP Server for Remote WOL Requesting from an CSV Computer List

A HTTP Server who send Wake On Lan Package on an HTTP Request.

### Simple Bootstrap UI for the easy Usage.

![Screenshot](https://github.com/daBONDi/go-rest-wol/raw/master/screenshot.PNG)

### Simple REST API to let a Machine wake someone up

/api/computer/**<ComputerName>** -  Returns a JSON Object

```json
{
  "success":true,
  "message":"Succesfully Wakeup Computer Computer1 with Mac 64-07-2D-BB-BB-BF on Broadcast IP 192.168.10.254:9",
  "error":null
}
```

## Command Line Arguments

| Commandline Argument | Example          | Description                                                                            |
| -------------------- | ---------------- | -------------------------------------------------------------------------------------- |
| --port               | --port 80        | Define the Port where the Webserver will listen to **(Default: 8080)**                 |
| --file               | --file comp.csv  | Path to the CSV File containing the Computerlist                                       |

## Computer List File CSV layout

### Columns
__&lt;name of the computer&gt;__,__&lt;mac address of the computer&gt;__,__&lt;broadcast ip to send the magic packet&gt;__


### Example

computers.csv
```csv
name,mac,ip
Computer1,64-07-2D-BB-BB-BF,192.168.10.254:9
Computer2,2D-F2-3D-06-17-00,192.168.10.254:9
Computer3,FF-B3-95-62-1C-DD,192.168.10.254:9
```

docker-compose.yml
```yml
version: '3'
services:
  wol:
    image: mitterm/go-rest-wol
    ports:
      - "8080:8080"
    environment:
      - "WOLFILE=/config/computer.csv"
    volumes:
      - "./config:/config"
    network_mode: "host"
```

### Credits
Full credits go to [daBONDi](https://github.com/daBONDi/go-rest-wol)

