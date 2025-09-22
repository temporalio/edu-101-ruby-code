# Service Workflow Demo
This demo shows an Activity that invokes a translation microservice, accessible via HTTP, to provide a Spanish greeting for the specified name.

Before continuing, kill all Worker instances still running from previous exercises.

### Run the Workflow
Since this Workflow depends on the translation microservice, start that 
first by running this command in a terminal window:

```
$ ruby microservice.rb
```

Next, use a separate terminal window to start the Worker:

```
$ ruby worker.rb
```

Finally, use another terminal window to start the Workflow,
using the supplied code, specifying your name as input.

```
$ ruby starter.rb Donna
```

#### This is the end of the demo
