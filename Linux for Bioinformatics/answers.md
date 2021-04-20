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

Q7. what does the sudo docker run part of the command do? and what does the salmon swim part of the command do?

A. Run a command in a container, run a "super-secret operation" which prints an
   ASCII art version of Salmon.

   __Note__: You'll need the `-a` flag in order to actually free up space:
   `sudo docker system prune -a`.

Q8. What is the output of this command?

A. serveruser is not in the sudoers file.  This incident will be reported.

Q9. what does -c bioconda do?

A. Lets you specify a channel to install from.

Q10. What does the -o athal.ga.gz part of the command do?

A. Tells curl to write the data to a specified file, instead of my terminal.

Q11. What is a .gz file?

A. Archive file compressed with gzip.

Q12. What does the zcat command do?

A. Uncompressed a file and prints it to my terminal.

Q13. what does the head command do?

A. Show the first n lines of some files (or whatever is in standard input).

Q14. what does the number 100 signify in the command?

A. Only show the first 100 lines.

Q15. What is | doing?

A. Pass the output of zcat into the input of head.

Q16. What format are the downloaded sequencing reads in?

A. .sra

Q17. What is the total size of the disk?

A. 7.7G

Q18. How much space is remaining on the disk?

A. 2.8G

   _Note_: I have more disk space than you would expect because I used the `-a`
   flag in `docker system prune`.

Q19. What went wrong?

A. I get: `storage exhausted while writing file within file system module`
   because I ran out of disk space.

Q20: What was your solution?

A. Use the `--gzip` flag.
