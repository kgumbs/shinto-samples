Run the Application
To run the application, run the following command in a terminal window (in the complete) directory:

./gradlew bootRun
If you use Maven, run the following command in a terminal window (in the complete) directory:

./mvnw spring-boot:run
You should see output similar to the following:

To see all tasks and more detail, run gradlew tasks --all

To see more detail about a task, run gradlew help --task <task>


------------------------------------------------------------
All tasks runnable from root project
------------------------------------------------------------

Application tasks
-----------------
bootRun - Run the project with support for auto-detecting main class and reloading static resources

Build tasks
-----------
assemble - Assembles the outputs of this project.
bootRepackage - Repackage existing JAR and WAR archives so that they can be executed from the command line using 'java -jar'
build - Assembles and tests this project.
buildDependents - Assembles and tests this project and all projects that depend on it.
buildNeeded - Assembles and tests this project and all projects it depends on.
classes - Assembles main classes.
clean - Deletes the build directory.
integrationTestClasses - Assembles integration test classes.
jar - Assembles a jar archive containing the main classes.
testClasses - Assembles test classes.