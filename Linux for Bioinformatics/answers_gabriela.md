# Answers to questions from "Linux for Bioinformatics"

**Q1. What is your home directory?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; My current user’s home folder:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&gt; /home/Ubuntu*
<br><br>

**Q2. What is the output of this command?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The content of the current (or specified) directory are printed to screen, in my case: <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&gt; hello_world.txt*
<br><br>

**Q3. What is the output of each**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Only one of the folders still contains anything (my_folder2):
* `ls` on my_folder: nothing printed to screen as it is empty
* `ls` on my_folder2: *&gt; hello_world.txt*
<br><br>

**Q4. What is the output of each?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Using `mv` the moved file only persists at the new location while being removed from
the original location (vs. using `cp` the file will be at both the original and the new
location)
 * `ls` on my_folder: nothing printed to screen as it is empty
 * `ls` on my_folder2: nothing printed to screen as it is empty
 * `ls` on my_folder3: *&gt; hello_world.txt*
<br><br>

**Q5. Why didn&#39;t that work?**

 * The password for the new user (sudouser) is different
 * The public key is not saved in the correct folder for the new user (in fact the .ssh-folder does not exist at all)
 * After creation: the permissions for this folder are wrong
<br><br>

**Q6. What was the solution?**

1. Modify the password to sudouser’s password to `ssh` into the instance<br>
2. Issue with the public key<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Create .ssh-folder in the home directory of sudouser<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Add public key<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Change permissions of .ssh-folder and key (using `chmod`)<br>
<br><br>

**Q7. What does the sudo docker run part of the command do? What does the
salmon swim part of the command do?**

 * `sudo docker run`: starts and runs the docker - “The docker run command
creates a container from a given image and starts the container using a given
command.”
 * `salmon swim`: according to the salmon documentation, this command
*“perform[s] super-secret operation”*. What is actually does, is running a version
check to see if the most recent version of salmon is (installed+) running
<br><br>

**Q8. What is the output of this command?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Serveruser is not a sudo-user and will therefore not have permission to run sudo-
commands.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&gt; serveruser is not in the sudoers file. This incident will be reported.*
<br><br>

**Q9. What does -c bioconda do?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The `–c` flag is used for channel customization, to provide additional channels to
search for packages.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Note: installing using the suggested command resulted in installation but an library-
error when trying to run salmon. The command that worked instead:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`conda install -c conda-forge -c bioconda salmon`
<br><br>

**Q10. What does the -o athal.ga.gz part of the command do?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The `–o` flag customarily specifies an output folder or the name for an output file.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Similarly, here `–o` provides the name that the downloaded resource should be stored
as
<br><br>

**Q11. What is a `.gz` file?**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;It is a zip file that is compressed.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“Files with GZ extension are compressed archives that are created by the standard
GNU zip (gzip) compression algorithm”
<br><br>

**Q12. What does the `zcat` command do?**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Decompresses and concatenates files to standard output
<br><br>

**Q13. What does the `head` command do?** + **Q14. What does the number 100
signify in the command?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`head` displays the beginning of a text file or piped data.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The `–n` flag is used to specify how many lines should be shown from the beginning of the file. The default setting is
`–n 10`. `–n 10` will therefore display the first 100 lines of the file
<br><br>

**Q15. What is `|` doing?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The pipe operator takes the output of one command (the command in front of the
pipe) and feeds that output to another command (the command after the pipe) as
input
<br><br>

**Q16. What format are the downloaded sequencing reads in?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The downloaded files are in .sra
<br><br>

**Q17. What is the total size of the disk?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **9.6G** of which **7.7G** were allocated to /dev/root
<br><br>

**Q18. How much space is remaining on the disk?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;on /dev/root: **1.6G** still available
<br><br>

**Q19. What went wrong?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The file was downloaded as zip (in a compressed format)
<br><br>

**Q20: What was your solution?**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Decompress file and run command again using the *.fastq* version.





