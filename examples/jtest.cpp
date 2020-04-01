
#include <stdio.h>
#include <stdlib.h>
#include <setjmp.h>
#include <signal.h>
#include <google/coredumper.h>

#include <thread>
#include <iostream>

void signal_handler(int signo)
{
    fprintf(stderr, "app falut: signal: %d\n", signo);
    int ret = WriteCoreDump("gcoredump.dmp"); 
    fprintf(stderr, "WriteCoreDump return: %d\n", ret);
    exit(-1);
}

void trigger_crash()
{
    char *q;
    q = 0;
    q[2] = 'b';
}



int main(int argc, char *argv[])
{
    #if 1
    struct sigaction sa;

    sa.sa_flags = SA_SIGINFO;
    sigemptyset(&sa.sa_mask);
    sa.sa_handler = &signal_handler;

    sigaction(SIGSEGV, &sa, NULL);
    #else
    signal(SIGSEGV, &signal_handler);
    signal(SIGFPE,  &signal_handler);
    #endif

    std::thread trigger(trigger_crash);
    trigger.join();
    std::cout << "done" << std::endl;
    return 0;
}
