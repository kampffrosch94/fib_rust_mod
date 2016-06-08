/*  
 *  hello-1.c - The simplest kernel module.
 */
#include <linux/module.h>   /* Needed by all modules */
#include <linux/kernel.h>   /* Needed for KERN_INFO */

extern unsigned int add(unsigned int lhs, unsigned int rhs);
extern unsigned int fib(unsigned int fib);

int my_module_init(void)
{
    printk(KERN_INFO "Hello world fib(10) = %u.\n", fib(10));
    return 0;
}

void my_module_exit(void)
{
    printk(KERN_INFO "Goodbye world 1.\n");
}

module_init(my_module_init);
module_exit(my_module_exit);
