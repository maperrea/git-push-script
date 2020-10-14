A small zsh script for easier git pushing.

It adds all modifications, asks for confirmation after having printed said modifications and then asks for a commit message.

If the -fast parameter is supplied it automaticaly pushes with a default message.

In both cases you can specify a remote repository and a branch to the script as two last arguments.

If the push fails it asks for a correct repository and branch.
