# Lesson 1: Main Loop

At this point, I'm assuming you're familiar with the basics of programming. By that I mean you shouldn't be uncomfortable when I use the words "variable", "function", "loop", "if statement", "data type", "primitive", etc. If you don't understand this, you'll quickly get confused, so please brush up on basic coding and come back.

When you write C style code, you will often find yourself writing a main function like this:

```c
int main(int argc, char *argv[]) {
    // Your code here
    return 0;
}
```

This is an entrypoint construct that exists in most programming languages. The idea is when your code is executed by a shell, your process is provided with some arguments, and the entrypoint is called. This is where your program starts, and ends. And unless you have a bug, you'll typically see this as your exit point too.

For embedded systems, you typically will define a loop inside this function for your code to run in. Sometimes this is called the "main loop", but I will refer to it as the "event loop" for now. This helps us shift our focus from a procedural paradigm to an event driven paradigm, which will be very useful. So a basic embedded program may look like this:

```c
int main(int argc, char *argv[]) {
    // Initialize your system
    init();

    // Event loop
    while (1) {
        // Check for events
        if (event_available()) {
            // Handle event
            handle_event();
        }
        // Do other stuff
        do_other_stuff();
    }

    return 0;
}
```

