# react-with-trivy

## What's this?

This repository is sample repository for scan security vulnerabilities for frontend.
This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

This repository use [trivy](https://github.com/knqyf263/trivy) for security scan.
trivy detectable vulns of OS, OS Packages, npm and yarn in containers.

## Scan in local

You need to [install trivy](https://github.com/knqyf263/trivy#installation).

```
$ make build ci-scan
```

## How to apply own projects

1. Create application by [create-react-app](https://facebook.github.io/create-react-app/docs/getting-started#npm)
2. Copy `Dockefile.*`, `.circleci` and `makefile` from this project

## How to Development

Please check [Dockerizing a React App](https://mherman.org/blog/dockerizing-a-react-app/) by Michael Herman. 

```
$ docker build . -f Dockerfile.dev -t react-with-trivy:latest

...
Successfully tagged react-with-trivy:latest
 
$ docker run -v ${PWD}:/app -v /app/node_modules -p 3001:3000 \
  --rm react_with_trivy:latest


> react_with_trivy@0.1.0 start /app
> react-scripts start

Starting the development server...

Compiled successfully!

You can now view react_with_trivy in the browser.

  Local:            http://localhost:3000/
  On Your Network:  http://172.17.0.2:3000/

Note that the development build is not optimized.
To create a production build, use npm run build.

Compiling...
Compiled successfully!

```

and then, open your browser to http://localhost:3001/.
