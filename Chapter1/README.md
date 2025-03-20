# Chapter 1: Main Loop

At this point, I'm assuming you're familiar with the basics of programming. By that I mean you shouldn't be uncomfortable when I use the words "variable", "function", "loop", "if statement", "data type", "primitive", etc. If you don't understand this, you'll quickly get confused, so please brush up on basic coding and come back.

When you write C style code, you will often find yourself writing a main function like this:

```c
int main(int argc, char *argv[]) {
    // Your code here
    return 0;
}
```

If we aren't using those arguments (typical in embedded systems), it can be further simplified to this:

```c
int main(void) {
    // Your code here
    return 0;
}
```

This is an entrypoint construct that exists in most programming languages. The idea is that the start of your program is loaded into the CPU's Program Counter register, some initialization code is called, and then it loads whatever the main function is onto the stack and executes. This initialization code is specific to the compiler and CPU that you are using, its things like arranging memory addresses, setting up the stack, registers, etc. If this is all unfamiliar terminology, I suggest you find a good youtube video around embedded system program execution and memory layout.

For embedded systems, you typically will define a loop inside this function for your code to run in. Sometimes this is called the "main loop", but I will refer to it as the "event loop" for now. This helps us shift our focus from a procedural paradigm to an event driven paradigm, which will be very useful. So a basic embedded program may look like this:

```c
int main(void) {
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

Thinking about embedded systems in terms of events is the first step to real-time processing. If we can shift our thinking to this style, or programs become more responsive, and we avoid problems that come from traditional thinking. When you have multiple processes, cores, and threads, it is reasonable to switch that school of thought and you may be able to solve some problems easier by this. But with most embedded systems, reactivity is critical. So we will start by thinking in terms of that.

Let's look at the blink.c file for this chapter. It's a simple blink example.

```c
int main(void) {
    // Initialize the Hadware Abstraction Layer (HAL) so we can use it.
    // This is provided as part of our STM32 libraries we are including in main.h
    HAL_Init();
    // Initialize GPIO
    MX_GPIO_Init();

    while (1) {
        // The program will run indefinitely, blinking the LED on and off.
        HAL_GPIO_TogglePin(GPIOE, GPIO_PIN_3); // Toggle the LED pin
        HAL_Delay(1000); // Delay for 1000 milliseconds
    }

    // We won't get here because of the while loop above.
    return 0;
}
```

First we initialize our dependencies, then we loop and delay. This is very simple, but is using something that shouldn't sit right as you build bigger systems. Why are we artificially introducing a delay? Isn't this contrary to our goal of making things responsive? Let's try to rewrite it in a way that allows us to be more event driven.

```c
int main(void) {
    // Initialize the Hadware Abstraction Layer (HAL) so we can use it.
    // This is provided as part of our STM32 libraries we are including in main.h
    HAL_Init();
    // Initialize GPIO
    MX_GPIO_Init();

    uint32_t* events = {0};
    events[0] = 0; // Initialize the event counter
    uint32_t triggerValue = 1000000;
    while (1) {
        if (events[0] == triggerValue) {
            events[0] = 0; // Reset the event
            HAL_GPIO_TogglePin(GPIOE, GPIO_PIN_3); // Toggle the LED pin
        } else {
            // Increment the event counter
            events[0]++;
        }
    }

    // We won't get here because of the while loop above.
    return 0;
}
```

This is still very simple, but we've removed the delay by instead counting our loop iterations and waiting until a trigger to toggle the LED. Iteration (++) is a very cheap operation in ARM, so we can do this, and continue to execute other code in our program without blocking. This will become significant as we work more with GPIO peripherals, interrupts, and more.
