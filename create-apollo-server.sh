echo "Creating a new directory called $1";
mkdir $1;

echo "Initializing Node project";
pushd $1;
npm init --yes;

echo "Installing dependencies";
npm install --save apollo-server graphql;

echo "Installing dev dependencies";
npm install --save-dev eslint prettier nodemon @babel/core @babel/node @babel/preset-env;

popd;

echo "Copying eslint config file to '$1'";
cp ~/github/create-apollo-server/.eslintrc.json ./$1/.eslintrc.json;

echo "Copying Prettier config file to '$1'";
cp ~/github/create-apollo-server/.prettierrc.json ./$1/.prettierrc.json;

echo "Copying Babel Config to '$1'";
cp ~/github/create-apollo-server/.babelrc ./$1/.babelrc;

echo "Adding custom scripts to package.json";
node ~/github/create-apollo-server/addScriptsToPackageJson.js $1;

echo "Initializing $1 with initial files";

pushd $1;
mkdir src;
pushd src;
touch index.js;
echo 'import { ApolloServer } from "apollo-server";
import { typeDefs, resolvers } from "./schema";

const server = new ApolloServer({ typeDefs, resolvers });

server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});' >> index.js;

echo "Initializing Schema";

mkdir schema;
pushd schema;

touch index.js;
echo "import {
  RootQueryType,
  RootQueryResolvers,
} from './QueryType.js';
import {
	ExampleQueryType,
	ExampleQueryResolvers
} from './ExampleType.js';

export const typeDefs = [
  RootQueryType,
  ExampleQueryType,
];

export const resolvers = {
  ...RootQueryResolvers,
  ...ExampleQueryResolvers,
};" >> index.js;

touch QueryType.js;
echo 'import { gql } from "apollo-server";

export const RootQueryType = gql`
  type Query {
    _empty: String
  }
`;

export const RootQueryResolvers = {};
' >> QueryType.js;

touch ExampleType.js;
echo 'import { gql } from "apollo-server";

export const ExampleQueryType = gql`
  extend type Query {
    helloWorld: HelloWorld
  }

  type HelloWorld {
  	id: Int!
  	hello: String!
  }
`;

export const ExampleQueryResolvers = {
  Query: {
    helloWorld: () => ({
      id: 1,
      hello: "Hello World!",
    }),
  },

  HelloWorld: {
    id: parent => parent.id,
    hello: parent => parent.hello,
  },
};

' >> ExampleType.js;

popd;
pwd;

# verify that all changes work as expected
npm run test -- --watchAll=false;
npm run prettify && npm run lintify;

npm run sniff;

popd;
pwd;
popd;
pwd;