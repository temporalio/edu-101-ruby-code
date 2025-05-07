# Exercise 1: Hello Workflow
During this exercise, you will
* Review the business logic of the provided Workflow Definition to understand its behavior
* Modify the Worker initialization code to specify a task queue name
* Run the Worker initialization code to start the Worker process
* Execute the Workflow from the command line, specifying your name as input

Make your changes to the code in the `practice` subdirectory (look for TODO 
comments that will guide you to where you should make changes to the code). 
If you need a hint or want to verify your changes, look at the complete version 
in the `solution` subdirectory.

## Part A: Install the Ruby packages

### If you are using the Codespaces enviornment provided by the course you can skip this step!

1. Open a terminal window in the environment and change directories to the root directory of the
`edu-101-ruby-code` repository
2. Run the following command to install the Ruby packages

```
$ bundle install
```

The packages should install successfully onto your system.
Due to the nature of Gemfiles selecting the appropriate version and Ruby packaging, there is little danger in installing multiple versions.
However, if you would like to use a Ruby virtual environment manager, you can. 
This should in no way affect the course.

3. Navigate back to the practice directory

```
cd exercises/hello-workflow/practice/
```


## Part B: Review the Workflow Business Logic

1. Open the `greeting.rb` file (located in the `practice` subdirectory) in the editor
2. Review the input parameters and business logic. 

## Part C: Specify a Task Queue Name for the Worker

1. Open the `worker.rb` file (located in the `practice` subdirectory) in the editor
2. Specify `greeting-tasks` as the name of the task queue
3. Save your changes


## Part D: Start the Worker

2. Run the following command in the terminal window to start the Worker

```
$ ruby worker.rb
```

## Part E: Start the Workflow from the Command Line

1. Open another terminal window in the environment and change to the `practice` subdirectory for this exercise
2. Run the following command, replacing `Mason` with your first name. Be sure to retain the same quoting shown here when you run the command:

```
$ temporal workflow start \
    --type GreetSomeone \
    --task-queue greeting-tasks \
    --workflow-id my-first-workflow \
    --input '"Mason"' 
```

Notice the quoting for the input value, which has double quotes inside of single quotes. The input passed to the `temporal` command must be provided in JSON format and the quoting used here is necessary to pass the value through the shell and into the Workflow in the correct format.

Note that this command starts the Workflow, but it does not wait for it to complete or show the result. 

If you have time, continue with the optional part of the exercise below to see how to view the result using `temporal`.

### Using the CLI to Start a Workflow with Windows

The mix of single and double quotes we currently have pertains to UNIX-style shells. However, If you are running the Temporal CLI in Windows (such as Powershell), you will need to use Windows-style quote escaping like this:

```
temporal workflow start --type GreetSomeone --task-queue greeting-tasks --workflow-id my-first-workflow --input '\"Mason\"'
```

This is a general Windows approach for handling quotes in parameters, not something specific to Temporal.

## Part F (Optional): Display the Result
You can run the following command to display the result of a Workflow Execution: 

```
temporal workflow show --workflow-id my-first-workflow
```

It is also possible, and often more convenient, to view this information using the Web UI. You will 
have a chance to do this in the next exercise.


### This is the end of the exercise.




