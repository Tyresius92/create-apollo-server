# create-apollo-server

This repo contains a tool, similar to create-react-app, which bootstraps an Apollo Server. 

## Usage

```bash
git clone git@github.com:Tyresius92/create-apollo-server.git
```
The script assumes that it has been cloned to `~/github/create-apollo-server/create-apollo-server.sh` To modify this assumption, you can modify the lines beginning with `cp` in `create-apollo-server.sh` to point to your install location.

Then, in the location where you want to create your new server, you can run:
```bash
sh ~/github/create-apollo-server/create-apollo-server.sh <name-of-server>
```

For example, if this is your directory structure: 
```
github
├── create-apollo-server
│   └── create-apollo-server.sh
├── my-project-1
├── my-project-2
└── my-project-3
```
and you want to create an apollo server called `my-project-4`, you would run
```bash
cd ~/github
sh ./create-apollo-server/create-apollo-server.sh my-project-4
```
and you would end up with 
```
github
├── create-apollo-server
│   └── create-apollo-server.sh
├── my-project-1
├── my-project-2
├── my-project-3
└── my-project-4 
```

This will create a new directory called `my-project-4` that contains a minimal Apollo Server.
