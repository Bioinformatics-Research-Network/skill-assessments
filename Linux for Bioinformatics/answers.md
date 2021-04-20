# Answers

Q1. What is your home directory?

A. `/home/ubuntu`


Q2. What is the output of this command?

A. `hello_world.txt`

Q3. What is the output of each ls command?

A. Blank, `hello_world.txt`

Q4. What is the output of each?

A. Blank, blank, `hello_world.txt`

Q5. Why didn't that work?

A. SSH uses the private key in the `.pem` file and the public key within
   `authorized_keys` to authenticate. The public key was missing, so SSH
   couldn't authenticate.

Q6. What was the solution? 

A. Copy `/home/ubuntu/.ssh/authorized_keys` to `/home/sudouser/.ssh`
