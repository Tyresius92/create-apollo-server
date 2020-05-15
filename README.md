# create-apollo-server

This repo contains a tool, similar to create-react-app, which bootstraps an Apollo Server. 

## Usage

```bash
git clone <repo>
```
Then, in the directory where you want to create your Apollo Server, run
```bash
sh ./path/to/create-apollo-server/create-apollo-server.sh <name-of-server>
```

For example, if this is your directory structure: 
```
my-projects-directory
├── create-apollo-server
│   └── create-apollo-server.sh
├── my-project-1
├── my-project-2
└── my-project-3
```
and you want to create an apollo server called `my-project-4`, you would run
```bash
cd my-projects-directory

sh ./create-apollo-server/create-apollo-server.sh my-project-4
```

This will create a new directory called `my-project-4` that contains a minimal Apollo Server.
